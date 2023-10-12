import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/feature/widgets/buttons/cart_button/bloc/cart_button_bloc.dart';

import '../../core/constants/style/themes.dart';
import '../../core/utils/ui/app_ui_disable_glow_effect.dart';
import '../views/cart/utils/cart_database_controller.dart';
import '../views/catalog/catalog_view.dart';
import 'material_app_bloc/material_app_bloc.dart';

class App extends StatelessWidget {
  static final CartDatabaseController db = CartDatabaseController();

  const App({super.key});

  // TODO -	Подгрузка товаров по мере прокрутки
  // TODO - контроллер карусели
  // TODO подогнать шрифты и паддинги
  // TODO добавить сплэш скрин
  // TODO добавить иконку приложени
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MaterialAppBloc>(
          create: (context) => MaterialAppBloc()
            ..add(MaterialAppUpdateEvent(theme: LightTheme.themeData)),
        ),
        BlocProvider<CartButtonBloc>(
          create: (context) => CartButtonBloc()..add(CartButtonUpdate()),
        )
      ],
      child: BlocBuilder<MaterialAppBloc, MaterialAppState>(
        builder: (context, state) {
          if (state is MaterialAppInitialState) {
            return const Center(
                child: CircularProgressIndicator(color: LightTheme.primary));
          } else {
            return ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'LichiTest',
                  theme: (state as MaterialAppLoadedState).theme,
                  home: const CatalogView()),
            );
          }
        },
      ),
    );
  }
}
