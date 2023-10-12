import 'package:flutter/cupertino.dart';
import 'package:lichi_test/feature/views/product/models/product.dart';
import 'package:lichi_test/feature/views/product/models/product_photo.dart';

class ProductFunctions {
  static List<Widget> getProductCardImages(
      {required Product product, required BuildContext context}) {
    List<Widget> cardImages = [];
    for (ProductPhoto photo in product.photos) {
      cardImages.add(
        Image.network(photo.bigImage,
            fit: BoxFit.cover, width: double.infinity),
      );
    }
    return cardImages;
  }
}
