import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';
import 'package:lichi_test/feature/widgets/carousel_controller/carousel_circle.dart';

class CarouselControllerWidget extends StatelessWidget {
  final List<Widget> images;

  const CarouselControllerWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: context.theme.primaryColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            children: buildCircles()
        ),
      )
    );
  }

  List<CarouselCircleContainer> buildCircles() {
    List<CarouselCircleContainer> circles = [];

    for (var element in images) {
      circles.add(const CarouselCircleContainer());
    }
    circles[0].selectCircle();
    return circles;
  }
}
