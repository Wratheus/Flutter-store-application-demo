import 'package:flutter/cupertino.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class CarouselCircleContainer extends StatelessWidget {
  const CarouselCircleContainer({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.primaryColor));
  }
}
