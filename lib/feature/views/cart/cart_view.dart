import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/cart/bloc/cart_bloc.dart';
import 'package:lichi_test/feature/views/cart/utils/cart_functions.dart';
import 'package:lichi_test/feature/views/cart/widgets/cart_product_card.dart';
import 'package:lichi_test/feature/views/catalog/catalog_view.dart';
import 'package:lichi_test/feature/widgets/buttons/rectangle_button.dart';
import 'package:lichi_test/feature/widgets/custom_loading_widget.dart';
import 'package:lichi_test/feature/widgets/dialogs/error_dialog.dart';

import '../../../core/utils/ui/page_transition.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => CartBloc()..add(CartLoadEvent()),
        )
      ],
      child: BlocBuilder<CartBloc, CartState>(
          builder: (BuildContext context, CartState state) {
        if (state is CartInitialState) {
          return const CustomLoadingWidget();
        }
        if (state is CartLoadingState) {
          return const CustomLoadingWidget();
        }
        if (state is CartErrorState) {
          return const ErrorDialog(route: CartView());
        }
        if (state is CartLoadedState) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Корзина",
                  style: context.theme.textTheme.bodyMedium,
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        SlideRightRoute(
                            page: const CatalogView()));
                  },
                    child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 15,
                )),
              ),
              body: state.cartProductList.isNotEmpty
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.cartProductList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext _, int index) {
                                return CartProductCard(
                                    parentContext: context,
                                    product: state.cartProductList[index]);
                              },
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
                                    "${CartFunctions.calculateCartPrice(state.cartProductList)} руб.",
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
                                            context,
                                            SlideRightRoute(
                                                page: const CatalogView()))
                                      },
                                  child: Text(
                                    "ПЕРЕЙТИ К ОФОРМЛЕНИЮ",
                                    style: context.theme.textTheme.bodyMedium,
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                      "Корзина пустая\n Добавьте все что вы хотите.",
                      style: context.theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    )));
        }
        return const Placeholder();
      }),
    );
  }
}
