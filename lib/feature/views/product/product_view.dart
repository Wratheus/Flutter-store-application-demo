import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/feature/views/catalog/catalog_view.dart';
import 'package:lichi_test/feature/views/product/bloc/product_bloc.dart';
import 'package:lichi_test/feature/views/product/widgets/product_description.dart';
import 'package:lichi_test/feature/views/product/widgets/product_header.dart';
import 'package:lichi_test/feature/widgets/custom_loading_widget.dart';
import 'package:lichi_test/feature/widgets/dialogs/error_dialog.dart';

import 'models/product.dart';

class ProductView extends StatelessWidget {
  final Product? product;
  final int? productId;

  const ProductView({super.key, this.product, this.productId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
            create: (context) => ProductBloc()
              ..add(ProductLoadEvent(productId: productId, product: product))
        ),
      ],
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadedState) {
            return Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 500,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                        background: SafeArea(
                      child: ProductHeader(product: state.product),
                    )),
                  ),
                  ProductDescription(product: state.product)
                ],
              ),
            );
          }
          if (state is ProductLoadingState || state is ProductInitialState) {
            return const CustomLoadingWidget();
          }
          if (state is ProductLoadedState) {
            return const ErrorDialog(route: CatalogView());
          }
          return const ErrorDialog(route: CatalogView());
        },
      ),
    );
  }
}
