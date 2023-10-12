import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class CustomContainer extends StatelessWidget {
  final Color? color;
  final String? imageUrl;
  final Widget? child;
  final Size? size;
  final BoxFit? fit;

  const CustomContainer({Key? key, this.child, this.size, this.color, this.imageUrl, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size?.width,
        height: size?.height,
        decoration: BoxDecoration(
        image: imageUrl != null ? DecorationImage(
        image: NetworkImage(imageUrl!), fit: fit ?? BoxFit.fill) : null,
          borderRadius: BorderRadius.circular(10),
          color: color ?? context.theme.canvasColor,
        ),
        padding: const EdgeInsets.all(7),
        child: child);
  }
}
