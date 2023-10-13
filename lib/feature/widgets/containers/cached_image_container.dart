import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class CachedImageContainer extends StatelessWidget {
  final String imageUrl;
  final Size? size;
  final BorderRadius? borderRadius;
  final Widget? child;

  const CachedImageContainer(
      {super.key,
      this.size,
      required this.imageUrl,
      this.borderRadius,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Center(
                child: CircularProgressIndicator(
                    color: context.theme.primaryColor));
          },
          imageBuilder: (context, imageProvider) => Container(
                width: size?.width,
                height: size?.height,
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(18),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
          errorWidget: (BuildContext context, String url, Object error) {
            return Center(
                child: Text("Не удалось загрузить картинку!",
                    style: context.theme.textTheme.bodyMedium));
          }),
      child != null
          ? Positioned(bottom: 15, left: 15, child: child!)
          : Container()
    ]);
  }
}
