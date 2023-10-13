import 'package:flutter/material.dart';
import 'package:lichi_test/feature/widgets/carousel_controller/carousel_circle.dart';

import '../../views/product/models/product_photo.dart';

class CarouselControllerWidget extends StatelessWidget {
  final List<ProductPhoto> images;

  const CarouselControllerWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white60),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            for (var element in images) const Padding(
              padding: EdgeInsets.only(left: 3.0),
              child: CarouselCircleContainer(),
            )
          ]),
        ));
  }
}
