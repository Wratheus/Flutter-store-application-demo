import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

import '../../views/product/models/product_photo.dart';

class CarouselControllerWidget extends StatelessWidget {
  final List<ProductPhoto> images;
  final int selectedIndex;

  const CarouselControllerWidget(
      {super.key, required this.images, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white60),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            for (int index =0; index < images.length; index++)
              Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedIndex == index
                              ? context.theme.primaryColor
                              : context.theme.canvasColor)))
          ]),
        ));
  }
}
