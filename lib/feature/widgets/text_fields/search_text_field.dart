import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../core/constants/style/colors.dart';

class SearchTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  const SearchTextField({Key? key, this.hint, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
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
          hintStyle: context.theme.textTheme.bodyMedium?.copyWith(color: CustomColors.grey),
        ),
        style: context.theme.textTheme.bodyMedium?.copyWith(color: CustomColors.grey),
      ),
    );
  }

}
