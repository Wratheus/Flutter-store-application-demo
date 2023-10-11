import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../../../core/constants/style/themes.dart';
import '../../../app/material_app_bloc/material_app_bloc.dart';
import '../../../widgets/buttons/rectangle_button.dart';

class CatalogThemeSwitcher extends StatelessWidget {
  const CatalogThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: RectangleButton(
              onPressed: () => {
                    context.read<MaterialAppBloc>().add(
                        MaterialAppChangeThemeEvent(
                            theme: DarkTheme.themeData)),
                  },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.nights_stay,
                    size: 40.0,
                    color: context.theme.primaryColor,
                  ),
                  const SizedBox(width: 5),
                  Text("Темная тема",
                      style: context.theme.textTheme.bodyMedium),
                ],
              )),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: RectangleButton(
              onPressed: () => {
                    context.read<MaterialAppBloc>().add(
                        MaterialAppChangeThemeEvent(
                            theme: LightTheme.themeData)),
                  },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sunny,
                    size: 40.0,
                    color: context.theme.primaryColor,
                  ),
                  const SizedBox(width: 5),
                  Text("Светлая тема",
                      style: context.theme.textTheme.bodyMedium),
                ],
              )),
        )
      ],
    );
  }
}
