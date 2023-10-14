import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichi_test/feature/views/product/models/product.dart';
import 'package:lichi_test/feature/views/product/models/product_photo.dart';
import 'package:lichi_test/feature/widgets/carousel_controller/carousel_controller.dart';
import 'package:lichi_test/feature/widgets/containers/cached_image_container.dart';

import '../bloc/catalog_bloc.dart';

class CatalogFunctions {
  static List<Widget> getCatalogCardImages(
      {required Product product, bool isBig = false, bool isBorder = true}) {
    List<Widget> cardImages = [];
    for (ProductPhoto photo in product.photos) {
      cardImages.add(
        CachedImageContainer(
            imageUrl: isBig ? photo.bigImage : photo.mediumImage,
            borderRadius:
                isBorder ? BorderRadius.circular(18) : BorderRadius.circular(0),
            child: CarouselControllerWidget(images: product.photos)),
      );
    }
    return cardImages;
  }

  static void loadScroll({required BuildContext context}) {
    CatalogLoadedState state =
        (context.read<CatalogBloc>().state as CatalogLoadedState); //hardcoded state
    if (!(context.read<CatalogBloc>().isRequesting) &&
        state.maxPages != state.page) {
      context.read<CatalogBloc>().add(CatalogLoadScrollEvent(
          currentPage: state.page + 1,
          catalogCategory: state.category,
          products: state.catalogData,
          maxPages: state.maxPages));
    }
  }
}
