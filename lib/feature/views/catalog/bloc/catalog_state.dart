part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {}

class CatalogInitialState extends CatalogState {

}

class CatalogLoadingState extends CatalogState {

}

class CatalogLoadedState extends CatalogState {
  final List<Product> catalogData;

  CatalogLoadedState({required this.catalogData});
}

class CatalogErrorState extends CatalogState {

}
