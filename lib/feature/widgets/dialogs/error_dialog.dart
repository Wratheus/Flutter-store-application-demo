import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/core/utils/ui/page_transition.dart';
import 'package:lichi_test/feature/widgets/buttons/rectangle_button.dart';

class ErrorDialog extends StatelessWidget {
  final String error;
  final Widget route;

  const ErrorDialog(
      {super.key,
      this.error = "Произошла ошибка, пожалуйста повторите позднее",
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(error, style: context.theme.textTheme.bodyMedium),
          RectangleButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(SlideRightRoute(page: route));
              },
              child:
                  Text("Повторить", style: context.theme.textTheme.bodyMedium))
        ],
      ),
    );
  }
}
