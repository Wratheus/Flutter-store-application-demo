import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/product.dart';

part 'product_event.dart';

part 'product_state.dart';

// TODO реквесты к API
// TODO обработка ошибки, загрузки
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
