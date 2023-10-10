import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../core/utils/ui/page_transition.dart';
import '../../views/cart/cart_view.dart';

class CartCounterButton extends StatelessWidget {
  final Color? color;
  final bool reverseRow;

  const CartCounterButton({Key? key, this.color, this.reverseRow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Icon shopBag =
        Icon(Icons.shopping_bag, size: 15, color: context.theme.primaryColor);
    Text counter = Text("100", style: context.theme.textTheme.bodyMedium);

    return GestureDetector(
        onTap: () => {
              Navigator.pushReplacement(
                  context, SlideRightRoute(page: const CartView()))
            },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: color ?? context.theme.canvasColor,
            ),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: reverseRow
                    ? Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: shopBag,
                        ),
                        counter
                      ])
                    : Row(children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: counter),
                        shopBag,
                      ]))));
  }
}
