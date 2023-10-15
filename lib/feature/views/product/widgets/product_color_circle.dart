import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../../core/constants/style/colors.dart';

class ProductColorCircle extends StatelessWidget {
  final String colorStr;
  final Size size;
  final Widget? child;

  const ProductColorCircle(
      {super.key, required this.colorStr, required this.size, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          border: context.theme.primaryColor == CustomColors.dark &&
                  colorStr == "ffffff"
              ? Border.all()
              : null,
          color: colorStr.toColor(),
          shape: BoxShape.circle),
      child: child,
    );
  }
}
