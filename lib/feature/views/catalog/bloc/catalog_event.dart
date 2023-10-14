part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {}

class CatalogLoadEvent extends CatalogEvent {
  final String catalogCategory;

  CatalogLoadEvent({this.catalogCategory = "new"});
}

class CatalogLoadScrollEvent extends CatalogEvent {
  final List<Product> products;
  final int currentPage;
  final String catalogCategory;
  final int maxPages;

  CatalogLoadScrollEvent({required this.currentPage, required this.catalogCategory, required this.products, required this.maxPages});
}
