part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {}

class CatalogLoadEvent extends CatalogEvent {
  final String catalogCategory;

  CatalogLoadEvent({this.catalogCategory = "new"});
}
