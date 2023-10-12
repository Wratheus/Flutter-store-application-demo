import 'package:flutter/cupertino.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class CarouselCircleContainer extends StatefulWidget {
  const CarouselCircleContainer({super.key});

  @override
  State<CarouselCircleContainer> createState() =>
      _CarouselCircleContainerState();

  selectCircle() {
    _CarouselCircleContainerState()._selectCircle();
  }
}
class _CarouselCircleContainerState extends State<CarouselCircleContainer> {
  final bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    Color colorSelected = context.theme.primaryColor;
    Color colorDisabled = context.theme.splashColor;
    return Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: _isSelected ? colorSelected : colorDisabled));
  }

  _selectCircle() {
    setState(() {
      _isSelected ? false : true;
    });
  }
}
