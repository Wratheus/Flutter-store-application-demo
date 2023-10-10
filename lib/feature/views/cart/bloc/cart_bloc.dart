import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

// TODO импорт если есть API и импорт если есть локальная бд
// TODO обработка ошибки, загрузки
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
