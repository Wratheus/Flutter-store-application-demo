import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class CustomRectangleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Size? size;
  final Color? color;
  const CustomRectangleButton({Key? key, required this.onPressed, required this.child, this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size?.width,
        height: size?.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color ?? context.theme.canvasColor,
        ),
        padding: const EdgeInsets.all(7),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: child,
        )
      )
    );
  }
}