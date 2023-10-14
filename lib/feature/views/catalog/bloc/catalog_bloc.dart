import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/models/result.dart';
import '../../product/models/product.dart';
import '../utils/catalog_requests.dart';

part 'catalog_event.dart';

part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  bool isRequesting = false;

  CatalogBloc() : super(CatalogInitialState()) {
    on(_loadCatalog);
    on(_loadScroll);
  }

  _loadCatalog(CatalogLoadEvent event, Emitter<CatalogState> emit) async {
    emit(CatalogLoadingState());
    try {
      isRequesting = true;
      ApiResult res = await CatalogRequests.getCategoryProductList(
          category: event.catalogCategory);
      if (res.status) {
        emit(CatalogLoadedState(
            catalogData: res.data["products"], category: event.catalogCategory, maxPages: res.data["maxPages"]));
        isRequesting = false;
      } else {
        isRequesting = false;
      }
    } catch (e, t) {
      print(e);
      isRequesting = false;
      emit(CatalogErrorState());
    }
  }

  _loadScroll(CatalogLoadScrollEvent event, Emitter<CatalogState> emit) async {
    try {
      isRequesting = true;
      ApiResult res = await CatalogRequests.getCategoryProductList(
          category: event.catalogCategory, page: event.currentPage);
      if (res.status) {
        event.products
            .addAll(res.data["products"]); // add new products to list of loaded products
        emit(CatalogLoadedState(
            catalogData: event.products, category: event.catalogCategory, maxPages: event.maxPages));
        isRequesting = false;
      } else {
        isRequesting = false;
      }
    } catch (e, t) {
      isRequesting = false;
      emit(CatalogErrorState());
    }
  }
}
