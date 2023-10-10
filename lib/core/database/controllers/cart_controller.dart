import 'package:drift/drift.dart';
import 'package:lichi_test/core/database/database.dart';

import '../../../feature/views/product/models/product.dart';
import 'database_controller.dart';

class CartDatabaseController extends AppDatabase implements DatabaseController<Product> {

  @override
  Future<List<UserCartData>> loadData() async {
    List<UserCartData> result = await (select(userCart).get());
    return result;
  }
  @override
  Future<int> addItem({required Product item}) async {
    return await (into(userCart).insert( UserCartCompanion(
      itemId: Value(item.id),
      content: Value(itemJson.toString()),
      itemCount: Value(itemCount),
    )));
  }
  @override
  Future<int> removeItem({required Product item}) async {
    return await (delete(userCart)..
    where((tbl) =>
        tbl.itemId.equals(item.id))).
    go();
  }
}