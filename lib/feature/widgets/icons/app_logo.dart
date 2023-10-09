import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 38,
      backgroundColor: context.theme.primaryColor,
      child: Icon(const IconData(0xe3ae, fontFamily: 'MaterialIcons'),
        size: 54,
        color: context.theme.canvasColor,
      ),
    );
  }
}