import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'material_app_event.dart';

part 'material_app_state.dart';

class MaterialAppBloc extends Bloc<MaterialAppEvent, MaterialAppState> {
  MaterialAppBloc() : super(MaterialAppInitialState()) {
    on(_onChangeTheme);
  }

  _onChangeTheme(
      MaterialAppUpdateEvent event, Emitter<MaterialAppState> emit) async {
    emit(MaterialAppLoadedState(theme: event.theme));
    HapticFeedback.lightImpact();
  }
}
