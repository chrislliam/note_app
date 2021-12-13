import 'package:flutter/material.dart';
import '../../consts/colors_consts.dart';
import '../../consts/stylesFont_consts.dart';
import '../../interfaces/theme_app_interface.dart';

class AppThemeDark implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData(
        backgroundColor: ColorsConst.backgroundColorDark,
        scaffoldBackgroundColor: ColorsConst.backgroundColorDark,
        primaryColor: ColorsConst.primaryColorDark,
        hintColor: ColorsConst.secondaryColorDark,
        highlightColor: ColorsConst.highlightColorDark,
        disabledColor: ColorsConst.disabledColorDark,
        dividerColor: ColorsConst.disabledColorDark,
        textTheme: TextTheme(
            headline5: StylesFont.headline5Dark,
            headline6: StylesFont.headline6Dark,
            bodyText2: StylesFont.bodyText2Dark,
            subtitle1: StylesFont.subTitle1Dark,
            button: StylesFont.buttonDark,
            caption: StylesFont.captionDark),
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: ColorsConst.secondaryColorDark),
        //App Bar
        appBarTheme: AppBarTheme(
          elevation: 0.2,
          shadowColor: Color(0xFF9999AA),
          iconTheme: IconThemeData(color: ColorsConst.primaryColorDark),
          color: ColorsConst.backgroundColorDark,
          titleTextStyle: StylesFont.headline6Dark,
        ),
        //Botão
        hoverColor: ColorsConst.secondaryColorDark,
        buttonTheme: ButtonThemeData(
            height: 40,
            minWidth: 160,
            buttonColor: ColorsConst.backgroundColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textTheme: ButtonTextTheme.primary),

        // FloatingActionButtonTheme
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0.8, backgroundColor: ColorsConst.highlightColorDark),
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }

  // @override
  String themeToString() {
    return ThemeMode.dark.toString();
  }
}
