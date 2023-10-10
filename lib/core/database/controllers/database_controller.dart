import 'package:lichi_test/core/database/controllers/cart_controller.dart';

abstract class DatabaseController<T> {
  Future<int> addItem({required T item});

  Future<int> removeItem({required T item});

  Future loadData();
}

DatabaseController cartController = CartDatabaseController();
