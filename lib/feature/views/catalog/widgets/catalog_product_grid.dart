import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/feature/views/catalog/bloc/catalog_bloc.dart';

import '../../product/models/product.dart';
import 'catalog_product_card.dart';

class CatalogProductGrid extends StatelessWidget {
  const CatalogProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products =
        (context.read<CatalogBloc>().state as CatalogLoadedState).catalogData;
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,),
      delegate: SliverChildBuilderDelegate((context, index) {
        return CatalogProductCard(product: products[index]);
      }, childCount: products.length),
    );
  }
}

//CatalogProductCard(product: products[index]);
