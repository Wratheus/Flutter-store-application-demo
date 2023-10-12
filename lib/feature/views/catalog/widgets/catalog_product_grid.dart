import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/feature/views/catalog/bloc/catalog_bloc.dart';

import '../../product/models/product.dart';
import 'catalog_product_card.dart';

class CatalogProductGrid extends StatelessWidget {
  final List<Product> products;
  const CatalogProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
        mainAxisExtent: 250 + 100
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return CatalogProductCard(product: products[index]);
      },
          childCount: products.length,
      ),
    );
  }
}

//CatalogProductCard(product: products[index]);
