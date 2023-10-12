part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartLoadEvent extends CartEvent {}

class CartUpdateProductEvent extends CartEvent {
  final Function action;
  final Function updateButton;

  CartUpdateProductEvent({required this.action, required this.updateButton});
}
