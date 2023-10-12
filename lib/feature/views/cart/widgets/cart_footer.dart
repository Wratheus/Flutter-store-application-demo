import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../../core/database/database.dart';
import '../../../../core/utils/ui/page_transition.dart';
import '../../../widgets/buttons/rectangle_button.dart';
import '../../catalog/catalog_view.dart';
import '../utils/cart_functions.dart';

class CartFooter extends StatelessWidget {
  final List<UserCartData> cartProductList;
  const CartFooter({super.key, required this.cartProductList});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(
            "Стоимость товара(-ов):\t",
            style: context.theme.textTheme.bodyMedium,
          ),
          Text(
            "${CartFunctions.calculateCartPrice(cartProductList)} руб.",
            style: context.theme.textTheme.bodyMedium,
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: RectangleButton(
            onPressed: () => {
              Navigator.pushReplacement(
                  context,
                  SlideRightRoute(
                      page: const CatalogView()))
            },
            child: Text(
              "ПЕРЕЙТИ К ОФОРМЛЕНИЮ",
              style: context.theme.textTheme.bodyMedium,
            )),
      )
    ]);
  }
}
