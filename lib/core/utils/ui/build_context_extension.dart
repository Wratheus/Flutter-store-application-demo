import 'package:flutter/material.dart';

extension SizedContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mq => MediaQuery.of(this);

  Size get sizePx => mq.size;

  double get widthPx => sizePx.width;

  double get heightPx => sizePx.height;
}

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
