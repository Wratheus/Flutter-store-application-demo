import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/widgets/buttons/rectangle_button.dart';
import 'package:lichi_test/feature/widgets/containers/custom_container.dart';

import '../../../../core/utils/ui/page_transition.dart';
import '../../cart/cart_view.dart';
import '../models/product.dart';

class ProductAddDialog extends StatelessWidget {
  final Product product;

  const ProductAddDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          height: context.mq.size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Добавлено в корзину",
                        style: context.theme.textTheme.bodyLarge),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 75.0),
                        child: CustomContainer(
                          imageUrl: product.photos[0].smallImage,
                          size: const Size(150, 150),
                          fit: BoxFit.fitWidth,
                        )),
                    Text("Платье мини с объемными рукавами и вырезом на спинке",
                        style: context.theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Text("Размер ${product.modelSize}",
                          style: context.theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: RectangleButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, SlideRightRoute(page: const CartView()));
                        },
                        child: Text("Перейти в корзину",
                            style: context.theme.textTheme.bodyMedium),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RectangleButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.transparent,
                    child: Text("Закрыть",
                        style: context.theme.textTheme.bodyMedium)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
