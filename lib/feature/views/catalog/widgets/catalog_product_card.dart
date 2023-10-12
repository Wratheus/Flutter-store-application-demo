import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/catalog/utils/catalog_functions.dart';
import 'package:lichi_test/feature/views/product/models/product.dart';
import 'package:lichi_test/feature/views/product/widgets/product_color_circle.dart';
import 'package:lichi_test/feature/widgets/carousel_controller/carousel_controller.dart';
import 'package:lichi_test/feature/widgets/containers/custom_container.dart';

import '../../../../core/constants/style/colors.dart';
import '../../../../core/utils/ui/page_transition.dart';
import '../../product/product_view.dart';

class CatalogProductCard extends StatelessWidget {
  final Product product;

  const CatalogProductCard({super.key, required this.product});

// TODO сделать карусельку
  @override
  Widget build(BuildContext context) {
    String colorStr = product.colors.colorValue;
    return GestureDetector(
      onTap: () => {
        Navigator.of(context)
            .push(SlideRightRoute(page: ProductView(product: product)))
      },
      child: Column(
        children: [
          CarouselSlider(
              items: CatalogFunctions.getCatalogCardImages(product: product),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 240,
                enableInfiniteScroll: true,
                autoPlay: false,
                scrollDirection: Axis.horizontal,
              )
          ),
          const SizedBox(height: 5),
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
                colorStr: colorStr),
          )
        ],
      ),
    );
  }
}
