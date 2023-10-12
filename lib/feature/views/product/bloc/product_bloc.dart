import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/feature/views/product/utils/product_requests.dart';
import 'package:lichi_test/feature/widgets/buttons/cart_button/bloc/cart_button_bloc.dart';

import '../../../../core/utils/ui/app_ui_modals.dart';
import '../../../app/app.dart';
import '../models/product.dart';
import '../widgets/product_add_dialog.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductLoadEvent>(_loadProduct);
    on<ProductAddToCartEvent>(_addToCart);
  }

  _addToCart(ProductAddToCartEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      await App.db.insertUserCartData(item: event.product);
      event.context.read<CartButtonBloc>().add(CartButtonUpdate());
      emit(ProductLoadedState(product: event.product));
      AppUIModals.showCupertinoModalDialog(
          context: event.context,
          child: ProductAddDialog(product: event.product));
    } catch (e) {
      emit(ProductErrorState());
    }
  }

  _loadProduct(ProductLoadEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      if (event.product != null) {
        emit(ProductLoadedState(product: event.product!));
      } else {
        // else request product by Id
        Product product = (await ProductRequests.getProductDetail(
                productId: event.productId!))
            .data;
        emit(ProductLoadedState(product: product));
      }
    } catch (e) {
      emit(ProductErrorState());
    }
  }
}
