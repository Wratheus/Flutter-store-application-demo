import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/feature/views/product/bloc/product_bloc.dart';
import 'package:lichi_test/feature/views/product/widgets/product_description.dart';
import 'package:lichi_test/feature/views/product/widgets/product_header.dart';

import 'models/product.dart';

class ProductView extends StatelessWidget {
  final Product product;

  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(ProductLoadEvent()),
        )
      ],
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 500,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                      background: SafeArea(
                        child: ProductHeader(product: product),
                  )),
                ),
                ProductDescription(product: product)
              ],
            ),
          );
        },
      ),
    );
  }
}
