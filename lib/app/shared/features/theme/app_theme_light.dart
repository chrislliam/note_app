import 'package:flutter/material.dart';
import '../../consts/colors_consts.dart';
import '../../consts/stylesFont_consts.dart';
import '../../interfaces/theme_app_interface.dart';

class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData(
        backgroundColor: ColorsConst.backgroundColorLight,
        scaffoldBackgroundColor: ColorsConst.backgroundColorLight,
        primaryColor: ColorsConst.primaryColorLight,
        hintColor: ColorsConst.secondaryColorLight,
        highlightColor: ColorsConst.highlightColorLight,
        disabledColor: ColorsConst.disabledColorLight,
        dividerColor: ColorsConst.disabledColorLight,
        textTheme: TextTheme(
            headline5: StylesFont.headline5Light,
            headline6: StylesFont.headline6Light,
            bodyText2: StylesFont.bodyText2Light,
            subtitle1: StylesFont.subTitle1Light,
            button: StylesFont.buttonLight,
            caption: StylesFont.captionLight),
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: ColorsConst.secondaryColorLight),
        //App Bar
        appBarTheme: AppBarTheme(
            elevation: 0.2,
            shadowColor: Color(0xFF9999AA),
            iconTheme: IconThemeData(color: ColorsConst.secondaryColorLight),
            color: ColorsConst.backgroundColorLight,
            titleTextStyle: StylesFont.headline6Light),

        //Botão
        hoverColor: ColorsConst.secondaryColorLight,
        buttonTheme: ButtonThemeData(
            height: 40,
            minWidth: 160,
            buttonColor: ColorsConst.primaryColorLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textTheme: ButtonTextTheme.primary),

        // FloatingActionButtonTheme
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 1.0, backgroundColor: ColorsConst.highlightColorLight),
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }

  // @override
  String themeToString() {
    return ThemeMode.light.toString();
  }
}
