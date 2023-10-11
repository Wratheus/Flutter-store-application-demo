import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class ProductColorCircle extends StatelessWidget {
  final Color? color;
  final Size size;
  const ProductColorCircle({super.key, this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: color ?? context.theme.canvasColor,
        shape: BoxShape.circle
      ),
    );
  }
}
