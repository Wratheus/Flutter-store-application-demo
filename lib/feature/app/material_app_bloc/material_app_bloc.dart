import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'material_app_event.dart';

part 'material_app_state.dart';

class MaterialAppBloc extends Bloc<MaterialAppEvent, MaterialAppState> {
  MaterialAppBloc({required ThemeData theme})
      : super(MaterialAppLoadedState(theme: theme)) {
    on<MaterialAppChangeThemeEvent>(_onChangeTheme);
  }

  _onChangeTheme(
      MaterialAppChangeThemeEvent event, Emitter<MaterialAppState> emit) async {
    emit(MaterialAppLoadedState(theme: event.theme));
    HapticFeedback.lightImpact();
  }
}
