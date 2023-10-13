import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/database/database.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/cart/bloc/cart_bloc.dart';
import 'package:lichi_test/feature/views/cart/utils/cart_functions.dart';
import 'package:lichi_test/feature/widgets/containers/cached_image_container.dart';
import 'package:lichi_test/feature/widgets/containers/custom_container.dart';
import 'package:lichi_test/feature/widgets/product_color_circle.dart';

import '../../../app/app.dart';
import '../../../widgets/buttons/cart_button/bloc/cart_button_bloc.dart';

class CartProductCard extends StatelessWidget {
  final UserCartData product;
  final BuildContext parentContext;

  const CartProductCard(
      {super.key, required this.product, required this.parentContext});

  // TODO selected color icon
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          CartFunctions.loadProductById(
              context: context, userCartData: product);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                CachedImageContainer(
                  size: const Size(137, 184),
                  imageUrl: product.imageUrl,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white60),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ProductColorCircle(
                        colorStr: product.itemColor,
                        size: const Size(12, 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      product.title,
                      style: context.theme.textTheme.bodySmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9.0, bottom: 25),
                    child: Text(
                      "Размер ${product.itemSize}",
                      style: context.theme.textTheme.bodySmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      "${product.itemPrice} руб.",
                      style: context.theme.textTheme.bodyLarge,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          context.read<CartBloc>().add(CartUpdateProductEvent(
                              action: () => App.db
                                  .insertUserCartDataFromUserCartData(
                                      item: product),
                              updateButton: () => parentContext
                                  .read<CartButtonBloc>()
                                  .add(CartButtonUpdate())));
                        },
                        child: const CustomContainer(
                          child: Center(child: Icon(Icons.add)),
                        ),
                      ),
                      Text("${product.itemCount} ед.",
                          style: context.theme.textTheme.bodyMedium),
                      GestureDetector(
                        onTap: () {
                          context.read<CartBloc>().add(CartUpdateProductEvent(
                              action: () =>
                                  App.db.removeUserCartData(itemId: product.id),
                              updateButton: () => parentContext
                                  .read<CartButtonBloc>()
                                  .add(CartButtonUpdate())));
                        },
                        child: const CustomContainer(
                          child: Center(child: Icon(Icons.remove)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
