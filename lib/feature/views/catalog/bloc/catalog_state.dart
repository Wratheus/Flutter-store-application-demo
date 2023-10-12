part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {}

class CatalogInitialState extends CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogLoadedState extends CatalogState {
  final List<Product> catalogData;
  final String category;

  CatalogLoadedState({required this.catalogData, required this.category});
}

class CatalogErrorState extends CatalogState {}
