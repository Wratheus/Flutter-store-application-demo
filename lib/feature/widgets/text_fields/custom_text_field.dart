import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  const CustomTextField({Key? key, this.hint, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: FIX WIDTH
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.theme.primaryColor.withOpacity(0.05),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint ?? "",
          hintStyle: context.theme.textTheme.displayMedium,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: context.theme.primaryColor.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(10.0)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: context.theme.primaryColor),
              borderRadius: BorderRadius.circular(10.0)
          ),
        ),
        style: context.theme.textTheme.bodyMedium,
      ),
    );
  }

}
