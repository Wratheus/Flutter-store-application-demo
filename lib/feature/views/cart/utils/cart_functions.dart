import '../../../../core/database/database.dart';
import '../../../app/app.dart';

class CartFunctions {
  static num calculateCartPrice(List<UserCartData> cartProductList) {
    num cartPrice = 0;
    for (UserCartData element in cartProductList) {
      cartPrice += int.parse(element.itemPrice) * element.itemCount;
    }
    return cartPrice;
  }

  static Future<int> calculateCartItemsAmount() async {
    int cartItemCounter = 0;
    List<UserCartData> cartData = await App.db.selectAllUserCartData();
    for (UserCartData element in cartData) {
      cartItemCounter += element.itemCount;
    }
    return cartItemCounter;
  }
}
