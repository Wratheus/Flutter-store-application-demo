part of 'material_app_bloc.dart';

@immutable
abstract class MaterialAppEvent { }

class MaterialAppChangeThemeEvent extends MaterialAppEvent {
  final ThemeData theme;

  MaterialAppChangeThemeEvent({required this.theme}) : super();
}
