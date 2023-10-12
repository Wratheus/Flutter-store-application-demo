part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<UserCartData> cartProductList;

  CartLoadedState({required this.cartProductList});
}

class CartErrorState extends CartState {}
