import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/catalog/bloc/catalog_bloc.dart';
import 'package:lichi_test/feature/views/catalog/utils/catalog_functions.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_category_picker.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_header.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_load_page_circular.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_product_grid.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_theme_switcher.dart';
import 'package:lichi_test/feature/widgets/views/loading_view.dart';

import '../../widgets/buttons/cart_button/cart_button.dart';
import '../../widgets/views/error_view.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({super.key});

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
        builder: (BuildContext context, CatalogState state) {
      if (state is CatalogInitialState) {
        return const LoadingView();
      }
      if (state is CatalogLoadedState) {
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("Каталог товаров",
                  style: context.theme.textTheme.bodyMedium),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CartCounterButton(),
                ),
              ]),
          body: CustomScrollView(controller: _controller, slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((_, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      const CatalogHeader(),
                      const CatalogThemeSwitcher(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0, top: 40.0),
                        child: CatalogCategoryPicker(category: state.category),
                      ),
                    ],
                  ),
                );
              }, childCount: 1),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(5.0),
              sliver: CatalogProductGrid(products: state.catalogData),
            ),
            state.page != state.maxPages
                ? const SliverToBoxAdapter(child: CatalogLoadPageCircular())
                : Container()
          ]),
        );
      }
      if (state is CatalogLoadingState) {
        return const LoadingView();
      }
      if (state is CatalogErrorState) {
        return const ErrorView(route: CatalogView());
      }
      return const Placeholder();
    });
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      // on end scroll event load new products
      double maxScroll = _controller.position.maxScrollExtent;
      double currentScroll = _controller.position.pixels;
      double delta = 200.0; // or something else..
      if (maxScroll - currentScroll <= delta) {
        CatalogFunctions.loadScroll(context: context);
      }
    });
  }
}
