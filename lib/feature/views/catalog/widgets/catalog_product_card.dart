import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/catalog/utils/catalog_functions.dart';
import 'package:lichi_test/feature/views/product/models/product.dart';
import 'package:lichi_test/feature/widgets/product_color_circle.dart';

import '../../../../core/utils/ui/page_transition.dart';
import '../../product/product_view.dart';

class CatalogProductCard extends StatelessWidget {
  final Product product;

  const CatalogProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
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
                height: 235,
                enableInfiniteScroll: true,
                autoPlay: false,
                scrollDirection: Axis.horizontal,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "${product.price} руб.",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyLarge,
            ),
          ),
          Text(
            product.name,
            style: context.theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ProductColorCircle(
                size: const Size(10, 10),
                colorStr: product.colors.colorValue,
              ),
              for (String element in product.colors.otherColors)
                Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: ProductColorCircle(
                    size: const Size(10, 10),
                    colorStr: element,
                  ),
                )
            ]),
          )
        ],
      ),
    );
  }
}
