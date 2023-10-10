import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class SaleClosureButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  const SaleClosureButton({super.key, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: color ?? context.theme.canvasColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(Icons.close, size: 20, color: context.theme.primaryColor),
        ),
      ),
    );
  }
}
