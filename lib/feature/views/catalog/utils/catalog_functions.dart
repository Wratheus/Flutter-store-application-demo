import 'package:flutter/cupertino.dart';
import 'package:lichi_test/feature/views/product/models/product.dart';
import 'package:lichi_test/feature/views/product/models/product_photo.dart';
import 'package:lichi_test/feature/widgets/containers/cached_image_container.dart';

class CatalogFunctions {
  static List<Widget> getCatalogCardImages({required Product product}) {
    List<Widget> cardImages = [];
    for (ProductPhoto photo in product.photos) {
      cardImages.add(
        CachedImageContainer(imageUrl: photo.bigImage),
      );
    }
    return cardImages;
  }
}
