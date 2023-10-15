import 'package:flutter/material.dart';

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
          mainAxisExtent: 276 + 130), //image size + text elements
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return CatalogProductCard(product: products[index], parentContext: context);
        },
        childCount: products.length,
      ),
    );
  }
}
