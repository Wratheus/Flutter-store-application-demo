import 'package:flutter/cupertino.dart';

// TODO refactor paddings replace with constants
class LayoutConstants {
  static const kClubHeightCoefficient = 1.8;
  static const kHorizontalPadding = 10.0;
  static const kVerticalPadding = 20.0;
  static const kProductListPadding = 5.0;

  static const horizontalEdgeInsets =
      EdgeInsets.symmetric(horizontal: kHorizontalPadding);
  static const verticalEdgeInsets =
      EdgeInsets.symmetric(vertical: kVerticalPadding);
  static const fullEdgeInsets = EdgeInsets.symmetric(
      horizontal: kHorizontalPadding, vertical: kVerticalPadding);
  static const halfEdgeInsets = EdgeInsets.symmetric(
      horizontal: kHorizontalPadding, vertical: kVerticalPadding / 2);

  static const paddingBox = SizedBox(
    height: kVerticalPadding,
    width: 20,
  );
  static const halfPaddingBox = SizedBox(
    height: kVerticalPadding / 2,
    width: 20 / 2,
  );
  static const doublePaddingBox = SizedBox(
    height: kVerticalPadding * 2,
    width: 20 * 2,
  );

  static const iconSize = 14.0;
}
