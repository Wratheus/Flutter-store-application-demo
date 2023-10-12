import 'package:flutter/material.dart';

import '../../../../core/database/database.dart';
import '../../../../core/utils/ui/page_transition.dart';
import '../../../app/app.dart';
import '../../product/product_view.dart';

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

  static void loadProductById(
      {required BuildContext context, required UserCartData userCartData}) {
    Navigator.push(context,
        SlideRightRoute(page: ProductView(productId: userCartData.itemId)));
  }
}
