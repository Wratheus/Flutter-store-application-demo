import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/style/themes.dart';
import '../views/catalog/catalog_view.dart';
import 'material_app_bloc/material_app_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});
// TODO: вынести микровиджеты логические куски страниц
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
              home: const CatalogView());
        },
      ),
    );
  }
}
