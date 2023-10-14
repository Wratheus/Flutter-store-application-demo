part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {}

class CatalogInitialState extends CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogLoadedState extends CatalogState {
  final int maxPages;
  final List<Product> catalogData;
  final String category;
  final int page;

  CatalogLoadedState({required this.catalogData, required this.category, this.page = 1, required this.maxPages});
}

class CatalogErrorState extends CatalogState {}
