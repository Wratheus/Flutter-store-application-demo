part of 'cart_button_bloc.dart';

@immutable
abstract class CartButtonState {}

class CartButtonInitialState extends CartButtonState {}

class CartButtonLoadedState extends CartButtonState {
  final int counter;

  CartButtonLoadedState({required this.counter});
}
