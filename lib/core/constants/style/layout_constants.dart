import 'package:flutter/cupertino.dart';
import 'package:lichi_test/core/utils/ui/build_context_extension.dart';

class LayoutConstants {
  static const kClubHeightCoefficient = 1.8;
  static const kHorizontalPadding = 10.0;
  static const kVerticalPadding = 20.0;
  static const kProductListPadding = 5.0;
  static const kTextFieldBottomPadding = 15.0;
  static const kBottomBarBottomPadding = 100.0;
  static const kBottomBarBottomHeight = 56.0;

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
  static const bottomBarBottomPadding = SizedBox(
    height: kBottomBarBottomPadding,
  );

  static const double miniatureImageWidth = 140;
  static const double miniatureImageHeight = 90;
  static const double appBarHeight = 44.0;
  static const double appBarExpandedHeight = 120.0;
  static const double textFieldHeight = 40.0;

  static const homePageGridGap = 1.0;

  static const iconSize = 14.0;
  static const bigIconSize = 25.0;
  static const smallIconSize = 8.0;

  /// переделать иконку для одинакового размера
  static const heartIconSize = iconSize + 5;

  static const modalMaxWidth = 500.0;
  static const contentMaximumWidth = 512.0;
  static const phoneMaxSize = 700;

  static double getModalWindowWidth(BuildContext context) {
    if (context.isPortrait) {
      return context.widthPx / 2;
    } else {
      return modalMaxWidth;
    }
  }
}