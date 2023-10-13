import 'package:flutter/cupertino.dart';
import 'package:lichi_test/feature/views/product/models/product.dart';
import 'package:lichi_test/feature/views/product/models/product_photo.dart';
import 'package:lichi_test/feature/widgets/carousel_controller/carousel_controller.dart';
import 'package:lichi_test/feature/widgets/containers/cached_image_container.dart';

class CatalogFunctions {
  static List<Widget> getCatalogCardImages(
      {required Product product, bool isBig = false, bool isBorder = true}) {
    List<Widget> cardImages = [];
    for (ProductPhoto photo in product.photos) {
      cardImages.add(
        CachedImageContainer(
            imageUrl: isBig ? photo.bigImage : photo.mediumImage,
            child: CarouselControllerWidget(images: product.photos),
            borderRadius: isBorder
                ? BorderRadius.circular(18)
                : BorderRadius.circular(0)),
      );
    }
    return cardImages;
  }
}
