import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/widgets/product_color_circle.dart';

import '../../../widgets/buttons/rectangle_button.dart';
import '../bloc/product_bloc.dart';
import '../models/product.dart';

class ProductDescription extends StatelessWidget {
  final Product product;
  const ProductDescription({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final List<Widget> circleColors = [
      ProductColorCircle(
        size: const Size(18, 18),
        colorStr: product.colors.colorValue,
      )
    ];
    for (String element in product.colors.otherColors) {
      circleColors.add(Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: ProductColorCircle(
          size: const Size(18, 18),
          colorStr: element,
        ),
      ));
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (_, int index) {
          return Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 27.0),
                  child: Text(
                    product.name,
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: circleColors),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 22),
                  child: Text(
                    product.colors.colorName,
                    style: context.theme.textTheme.bodySmall,
                  ),
                ),
                Text(
                  "${product.price} руб.",
                  style: context.theme.textTheme.bodyLarge,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 40.0),
                  child: RectangleButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(
                            ProductAddToCartEvent(
                                context: context,
                                product: product));
                      },
                      child: Text("Добавить в корзину",
                          style:
                          context.theme.textTheme.bodyMedium)),
                ),
                Text(
                  product.descriptions,
                  style: context.theme.textTheme.bodyMedium,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          );
        },
        childCount: 1,
      ),
    );
  }
}
