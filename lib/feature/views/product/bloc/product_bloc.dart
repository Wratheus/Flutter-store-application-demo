import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';

part 'product_state.dart';

// TODO реквесты к API
// TODO обработка ошибки, загрузки
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
