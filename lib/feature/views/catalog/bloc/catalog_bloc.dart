import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'catalog_event.dart';

part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  // TODO выбор категорий (виджет)
  // TODO хэширование изображений
  // TODO реквесты к API
  // TODO обработка ошибки, загрузки
  CatalogBloc() : super(CatalogInitial()) {
    on<CatalogEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
