import 'package:flutter/cupertino.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../../core/database/database.dart';
import '../utils/cart_functions.dart';

class CartFooter extends StatelessWidget {
  final List<UserCartData> cartProductList;

  const CartFooter({super.key, required this.cartProductList});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "К оплате",
        style: context.theme.textTheme.bodyMedium,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 20),
        child: Text(
          "${CartFunctions.calculateCartPrice(cartProductList)} руб.",
          style: context.theme.textTheme.bodyLarge,
        ),
      ),
    ]);
  }
}
