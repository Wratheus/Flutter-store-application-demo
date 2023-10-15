import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/core/utils/ui/page_transition.dart';
import 'package:lichi_test/feature/widgets/buttons/rectangle_button.dart';

class ErrorView extends StatelessWidget {
  final String error;
  final Widget route;

  const ErrorView(
      {super.key,
      this.error = "Произошла ошибка, пожалуйста повторите позднее",
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(error, style: context.theme.textTheme.bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height: 200),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: RectangleButton(
                  size: const Size(150, 51),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(SlideRightRoute(page: route));
                    },
                    child:
                        Text("Повторить", style: context.theme.textTheme.bodyMedium)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
