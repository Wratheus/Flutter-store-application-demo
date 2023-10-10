import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../../core/utils/ui/page_transition.dart';
import '../../product/product_view.dart';

class CatalogProductCard extends StatelessWidget {
  const CatalogProductCard({super.key});

// TODO сделать карусельку
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(SlideRightRoute(page: const ProductView()))
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(
            size: 50,
          ),
          const SizedBox(height: 20),
          Text(
            "Рубашка в тонкую полоску",
            style: context.theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 5),
          Text(
            "4 299 руб.",
            style: context.theme.textTheme.bodySmall,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 3.5,
            ),
          )
        ],
      ),
    );
  }
}
