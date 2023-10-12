import 'package:flutter/cupertino.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../widgets/buttons/cart_button/cart_button.dart';
import '../../../widgets/buttons/closure_button.dart';
import '../../../widgets/containers/cached_image_container.dart';
import '../models/product.dart';

class ProductHeader extends StatelessWidget {
  final Product product;
  const ProductHeader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        CachedImageContainer(imageUrl: product.photos[0].bigImage),
        const Positioned(
          left: 0,
          top: 0,
          child: Padding(
            padding: EdgeInsets.only(top: 5.0, left: 5.0),
            child: CartCounterButton(reverseRow: true),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 5.0),
            child: ClosureButton(onPressed: () {
              Navigator.of(context).pop();
            }),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Text(
            "D E S I G N E D  I N  G E R M A N Y",
            style: context.theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
