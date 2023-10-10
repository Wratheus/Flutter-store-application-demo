import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class ClosureButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  const ClosureButton({super.key, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? context.theme.canvasColor,
          shape: BoxShape.circle
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.close, size: 15, color: context.theme.primaryColor),
        ),
      ),
    );
  }
}
