part of 'material_app_bloc.dart';

@immutable
abstract class MaterialAppState {}

class MaterialAppLoadedState extends MaterialAppState {
  final ThemeData theme;

  MaterialAppLoadedState({required this.theme});
}

class MaterialAppInitialState extends MaterialAppState {

}
