import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/product/models/product.dart';
import 'package:lichi_test/feature/views/product/widgets/product_color_circle.dart';
import 'package:lichi_test/feature/widgets/containers/custom_container.dart';

import '../../../../core/utils/ui/page_transition.dart';
import '../../product/product_view.dart';

class CatalogProductCard extends StatelessWidget {
  final Product product;

  const CatalogProductCard({super.key, required this.product});

// TODO сделать карусельку
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context)
            .push(SlideRightRoute(page: ProductView(product: product)))
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomContainer(
              size: Size(200, 280),
              imageUrl: product.photos[0].smallImage,
              child: const Placeholder()),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: context.theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            product.price,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodySmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ProductColorCircle(
                size: const Size(15, 15),
                color: Color(int.parse(product.colors.colorValue, radix: 16))),
          )
        ],
      ),
    );
  }
}
