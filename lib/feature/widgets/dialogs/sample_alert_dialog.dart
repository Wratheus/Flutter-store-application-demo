// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../core/utils/ui/page_transition.dart';

class SampleAlertDialog extends StatelessWidget {
  String alertMessageStr;
  String tittleStr;
  Widget? route;
  SampleAlertDialog({Key? key, required this.alertMessageStr, required this.tittleStr, this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.canvasColor,
      title: Text("$tittleStr 🤩", style: context.theme.textTheme.bodyMedium, textAlign: TextAlign.center),
      content: Text(alertMessageStr, style: context.theme.textTheme.bodyMedium, textAlign: TextAlign.center),
      actions: [
        TextButton(
          child: Text("OK", style: context.theme.textTheme.bodyMedium,),
          onPressed: ()=> {
            Navigator.of(context).pop(),
            if (route != null){Navigator.pushReplacement(context, SlideRightRoute(page: route!))}
          }
        )
      ],
    );
  }
}
