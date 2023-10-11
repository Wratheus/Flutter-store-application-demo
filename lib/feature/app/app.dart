import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/style/themes.dart';
import '../../core/utils/ui/app_ui_disable_glow_effect.dart';
import '../views/catalog/catalog_view.dart';
import 'material_app_bloc/material_app_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});
// TODO: вынести микровиджеты логические куски страниц
// TODO: во все GestureDetector прописать фиксы behavior: HitTestBehavior.translusent реквесты ТЗ
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
          return ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'LichiTest',
                theme: (state as MaterialAppLoadedState).theme,

                home: const CatalogView()),
          );
        },
      ),
    );
  }
}
