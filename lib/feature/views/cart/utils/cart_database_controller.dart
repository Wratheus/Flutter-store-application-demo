import 'package:drift/drift.dart';
import 'package:lichi_test/core/database/database.dart';

import '../../product/models/product.dart';
import '../../../../core/database/controllers/database_controller.dart';

class CartDatabaseController extends AppDatabase
    implements DatabaseController<Product> {
  @override
  Future<List<UserCartData>> selectAllUserCartData() async {
    return await (select(userCart).get());
  }

  @override
  Future<int> insertUserCartData({required Product item}) async {
    List<UserCartData> tableData = await selectAllUserCartData();
    for (UserCartData element in tableData) {
      if (item.id == element.id) {
        await update(userCart).replace(element.copyWith(itemCount: element.itemCount + 1));
        return 0;
        // if Duplicate exist increment item count and update DB
      }
    }
    return await (into(userCart).insert(UserCartCompanion(
      itemId: Value(item.id),
      title: Value(item.name),
      imageUrl: Value(item.photos[0].smallImage),
      itemSize: Value(item.modelSize),
      itemPrice: Value(item.price),
      itemColor: Value(item.colors.colorValue.toString()),
      itemCount: const Value(1),
    )));
  }
  Future insertUserCartDataFromUserCartData({required UserCartData item}) async {
    List<UserCartData> tableData = await selectAllUserCartData();
    for (UserCartData element in tableData) {
      if (item.id == element.id) {
        return await update(userCart).replace(element.copyWith(itemCount: element.itemCount + 1)); // if Duplicate exist increment item count and update DB
      }
    }
  }


  @override
  Future<Object> removeUserCartData({required int itemId}) async {
    List<UserCartData> tableData = await selectAllUserCartData();
    for (UserCartData element in tableData) {
      if (itemId == element.id && element.itemCount > 1) {
        return await update(userCart).replace(element.copyWith(
            itemCount: element.itemCount -
                1)); // if Duplicate exist decrement item count and update DB
      }
    }
    return await (delete(userCart)..where((tbl) => tbl.id.equals(itemId)))
        .go();
  }
}
