import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/core/constants/style/themes.dart';

import 'package:lichi_test/feature/views/catalog/catalog_view.dart';

import 'core/utils/material_app_bloc/material_app_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MaterialAppBloc>(
          create: (context) => MaterialAppBloc(theme: LightTheme.themeData),
        )
      ],
      child: BlocBuilder<MaterialAppBloc, MaterialAppState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'LichiTest',
              theme: (state as MaterialAppLoadedState).theme,
              home: const CatalogView()
          );
        },
      ),
    );
  }
}


