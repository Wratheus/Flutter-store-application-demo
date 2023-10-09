// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import '../../../core/utils/ui/page_transition.dart';

class SampleErrorDialog extends StatelessWidget {
  String errorMessage;
  Widget? route;
  SampleErrorDialog({Key? key, required this.errorMessage, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.canvasColor,
      actions: [
        TextButton(
          child: Text("OK", style: context.theme.textTheme.bodyMedium,),
          onPressed: () => {
            if (route == null) {Navigator.pop(context)},
            if (route != null){Navigator.pushReplacement(context, SlideRightRoute(page: route!))}
          },
        )
      ],
      title: Text("Error 🥺", style: context.theme.textTheme.bodyMedium, textAlign: TextAlign.center,),
      content: Text(errorMessage, style: context.theme.textTheme.bodyMedium, textAlign: TextAlign.center),
    );
  }
}
