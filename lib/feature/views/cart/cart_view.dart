import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/cart/widgets/cart_product_card.dart';
import 'package:lichi_test/feature/widgets/buttons/rectangle_button.dart';

import '../../../core/utils/ui/page_transition.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Корзина",
            style: context.theme.textTheme.bodyMedium,
          ),
        ),
        body: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                CartProductCard(),
                CartProductCard(),
                CartProductCard(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "Стоимость товара(-ов):\t",
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  Text(
                    "9999 руб.",
                    style: context.theme.textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RectangleButton(
                  onPressed: () => {
                        Navigator.pushReplacement(
                            context, SlideRightRoute(page: const CartView()))
                      },
                  child: Text(
                    "ПЕРЕЙТИ К ОФОРМЛЕНИЮ",
                    style: context.theme.textTheme.bodyMedium,
                  )),
            )
          ],
        ));
  }
}
