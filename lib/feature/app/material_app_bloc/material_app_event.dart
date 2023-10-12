part of 'material_app_bloc.dart';

@immutable
abstract class MaterialAppEvent {}

class MaterialAppUpdateEvent extends MaterialAppEvent {
  final ThemeData theme;

  MaterialAppUpdateEvent({required this.theme}) : super();
}
