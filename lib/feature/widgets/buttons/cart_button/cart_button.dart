import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/catalog/catalog_view.dart';
import 'package:lichi_test/feature/widgets/buttons/cart_button/bloc/cart_button_bloc.dart';
import 'package:lichi_test/feature/widgets/dialogs/error_dialog.dart';

import '../../../../core/utils/ui/page_transition.dart';
import '../../../views/cart/cart_view.dart';

class CartCounterButton extends StatelessWidget {
  final Color? color;
  final bool reverseRow;

  const CartCounterButton({Key? key, this.color, this.reverseRow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CartButtonBloc()..add(CartButtonUpdate()),
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
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
                    child: BlocBuilder<CartButtonBloc, CartButtonState>(
                        builder: (context, state) {
                      final Icon shopBag = Icon(Icons.shopping_bag,
                          size: 15, color: context.theme.primaryColor);

                      if (state is CartButtonInitialState) {
                        return reverseRow
                            ? Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: shopBag,
                                ),
                                SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: context.theme.primaryColor),
                                )
                              ])
                            : Row(children: [
                                Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: SizedBox(
                                      width: 10,
                                      height: 10,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: context.theme.primaryColor),
                                    )),
                                shopBag,
                              ]);
                      }
                      if (state is CartButtonLoadedState) {
                        Text counter = Text(state.counter.toString(),
                            style: context.theme.textTheme.bodyMedium);
                        return reverseRow
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
                              ]);
                      }
                      return const ErrorDialog(route: CatalogView());
                    })))));
  }
}
