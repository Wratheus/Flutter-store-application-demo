import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../views/cart/utils/cart_functions.dart';

part 'cart_button_event.dart';

part 'cart_button_state.dart';

class CartButtonBloc extends Bloc<CartButtonEvent, CartButtonState> {
  CartButtonBloc() : super(CartButtonInitialState()) {
    on(_onButtonUpdate);
  }

  _onButtonUpdate(CartButtonUpdate event, Emitter<CartButtonState> emit) async {
    emit(CartButtonLoadedState(
        counter: (await CartFunctions.calculateCartItemsAmount())));
  }
}
