import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/models/result.dart';
import '../../product/models/product.dart';
import '../utils/catalog_requests.dart';

part 'catalog_event.dart';

part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  // TODO выбор категорий (виджет)
  // TODO хэширование изображений
  CatalogBloc() : super(CatalogInitialState()) {
    on(_loadCatalog);
  }

  _loadCatalog(CatalogLoadEvent event, Emitter<CatalogState> emit) async {
    emit(CatalogLoadingState());
    try {
      ApiResult res = await CatalogRequests.getCategoryProductList(category: event.catalogCategory);
      if (res.status) {
        emit(CatalogLoadedState(catalogData: res.data));
      } else {
        emit(CatalogErrorState());
      }
    } catch(e, stackTrace) {
      print(e);
      print(stackTrace);
      emit(CatalogErrorState());
    }
  }
}