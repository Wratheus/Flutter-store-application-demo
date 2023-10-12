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
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      product.title,
                      style: context.theme.textTheme.bodySmall,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    "Размер ${product.itemSize}",
                    style: context.theme.textTheme.bodySmall,
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ProductColorCircle(
                      colorStr: product.itemColor,
                      size: const Size(18, 18),
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${product.itemPrice} руб.",
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("${product.itemCount} ед.",
                            style: context.theme.textTheme.bodyMedium),
                      ),
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
