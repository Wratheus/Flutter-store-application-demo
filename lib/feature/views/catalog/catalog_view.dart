import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/catalog/bloc/catalog_bloc.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_category_picker.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_header.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_product_grid.dart';
import 'package:lichi_test/feature/views/catalog/widgets/catalog_theme_switcher.dart';
import 'package:lichi_test/feature/widgets/custom_loading_widget.dart';
import 'package:lichi_test/feature/widgets/dialogs/error_dialog.dart';

import '../../widgets/buttons/cart_button/cart_button.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CatalogBloc>(
            create: (context) => CatalogBloc()..add(CatalogLoadEvent()),
          )
        ],
        child: BlocBuilder<CatalogBloc, CatalogState>(
            builder: (BuildContext context, CatalogState state) {
          if (state is CatalogInitialState) {
            return const CustomLoadingWidget();
          }
          if (state is CatalogLoadedState) {
            return Scaffold(
              appBar: AppBar(
                  title: Text("Каталог товаров",
                      style: context.theme.textTheme.bodyMedium),
                  actions: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CartCounterButton(),
                    ),
                  ]),
              body: CustomScrollView(slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((_, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const CatalogHeader(),
                          const CatalogThemeSwitcher(),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child:
                                CatalogCategoryPicker(category: state.category),
                          ),
                        ],
                      ),
                    );
                  }, childCount: 1),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: CatalogProductGrid(products: state.catalogData),
                ),
              ]),
            );
          }
          if (state is CatalogLoadingState) {
            return const CustomLoadingWidget();
          }
          if (state is CatalogErrorState) {
            return const ErrorDialog(route: CatalogView());
          }
          return const Placeholder();
        }));
  }
}
