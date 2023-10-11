import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/views/product/product_view.dart';
import 'package:lichi_test/feature/widgets/containers/custom_container.dart';

import '../../../../core/utils/ui/page_transition.dart';
import '../../product/models/product.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key});

  // TODO selected color icon
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushReplacement(
      //       context, SlideRightRoute(page: ProductView()));
      // },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Column(
            children: [
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Рубашка в тонкую полоску",
                  style: context.theme.textTheme.bodySmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Размер XS",
                  style: context.theme.textTheme.bodySmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "4 599 руб.",
                  style: context.theme.textTheme.bodyLarge,
                ),
              ),
              Row(
                children: [
                  const CustomContainer(
                    child: Center(child: Icon(Icons.add)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                        Text("1 ed.", style: context.theme.textTheme.bodyMedium),
                  ),
                  const CustomContainer(
                    child: Center(child: Icon(Icons.remove)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
