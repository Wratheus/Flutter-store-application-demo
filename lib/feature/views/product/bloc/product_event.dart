part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class ProductLoadEvent extends ProductEvent {
  final int? productId;
  final Product? product;

  ProductLoadEvent({this.product, this.productId});
}

class ProductAddToCartEvent extends ProductEvent {
  final BuildContext context;
  final Product product;

  ProductAddToCartEvent({required this.context, required this.product});
}
