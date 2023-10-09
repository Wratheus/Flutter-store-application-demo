import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class SearchTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  const SearchTextField({Key? key, this.hint, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
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
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.theme.primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.theme.primaryColor),
          ),
          hintText: hint ?? "",
          hintStyle: context.theme.textTheme.titleMedium,
        ),
        style: context.theme.textTheme.titleMedium,
      ),
    );
  }

}
