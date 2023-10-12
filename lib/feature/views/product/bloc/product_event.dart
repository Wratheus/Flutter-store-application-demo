part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {

}

class ProductLoadEvent extends ProductEvent {

}
class ProductAddToCartEvent extends ProductEvent {
  final BuildContext context;
  final Product product;

  ProductAddToCartEvent({required this.context, required this.product});
}
