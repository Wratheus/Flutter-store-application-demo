abstract class DatabaseController<T> {
  Future<Object> insertUserCartData({required T item});

  Future<Object> removeUserCartData({required int itemId});

  Future selectAllUserCartData();
}
