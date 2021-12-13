import 'package:flutter/material.dart';

import 'colors_consts.dart';

const double headline5Size = 20;
const double headline6Size = 18;
const double subTitle1Size = 16;
const double bodyText2Size = 14;
const double buttonSize = 12;
const double captionSize = 12;

class StylesFont {
  static const TextStyle headline5Light = TextStyle(
      fontSize: headline5Size,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: ColorsConst.primaryColorLight);

  static const TextStyle headline6Light = TextStyle(
      color: ColorsConst.primaryColorLight,
      fontSize: headline6Size,
      fontWeight: FontWeight.normal);

  static const TextStyle subTitle1Light = TextStyle(
      color: ColorsConst.primaryColorLight,
      fontSize: subTitle1Size,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w500);

  static const TextStyle bodyText2Light = TextStyle(
      color: ColorsConst.primaryColorLight,
      fontSize: bodyText2Size,
      letterSpacing: 0.25,
      fontWeight: FontWeight.normal);

  static const TextStyle buttonLight = TextStyle(
      color: ColorsConst.secondaryColorLight,
      fontSize: buttonSize,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w500);

  static const TextStyle captionLight = TextStyle(
      color: ColorsConst.secondaryColorLight,
      fontSize: captionSize,
      letterSpacing: 0.4,
      fontWeight: FontWeight.normal);

  /// STYLE FONT DARK MODE
  static const TextStyle headline5Dark = TextStyle(
      fontSize: headline5Size,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: ColorsConst.primaryColorDark);

  static const TextStyle headline6Dark = TextStyle(
      color: ColorsConst.primaryColorDark,
      fontSize: headline6Size,
      fontWeight: FontWeight.normal);

  static const TextStyle subTitle1Dark = TextStyle(
      color: ColorsConst.primaryColorDark,
      fontSize: subTitle1Size,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w500);

  static const TextStyle bodyText2Dark = TextStyle(
      color: ColorsConst.primaryColorDark,
      fontSize: bodyText2Size,
      letterSpacing: 0.25,
      fontWeight: FontWeight.normal);

  static const TextStyle buttonDark = TextStyle(
      color: ColorsConst.primaryColorDark,
      fontSize: buttonSize,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w500);

  static const TextStyle captionDark = TextStyle(
      color: ColorsConst.secondaryColorDark,
      fontSize: captionSize,
      letterSpacing: 0.4,
      fontWeight: FontWeight.normal);
}
