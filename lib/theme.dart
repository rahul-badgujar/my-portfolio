import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';

class AppTheme {
  final ThemeData base;
  AppTheme({
    @required this.base,
  });

  ThemeData getTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      primaryColorLight: primaryColor,
      primaryColorDark: primaryColor,
      accentColor: primaryColor,
      buttonColor: primaryColor,
      scaffoldBackgroundColor: Color.fromRGBO(25, 25, 25, 1.0),
      textTheme: getTextTheme(),
      cardTheme: getCardTheme(),
      iconTheme: getIconTheme(),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ),
    );
  }

  IconThemeData getIconTheme() {
    return IconThemeData(
      color: primaryTextColorBright,
    );
  }

  CardTheme getCardTheme() {
    return base.cardTheme.copyWith(
      color: Color.fromRGBO(38, 38, 38, 1.0),
      elevation: 100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  TextTheme getTextTheme() {
    return base.textTheme.copyWith(
      headline1: base.textTheme.headline1.copyWith(
        color: primaryTextColor,
      ),
      headline4: base.textTheme.headline4.copyWith(
        color: primaryTextColor,
      ),
      headline5: base.textTheme.headline5.copyWith(
        color: primaryTextColor,
      ),
      subtitle1: base.textTheme.subtitle1.copyWith(
        color: primaryTextColor,
      ),
      subtitle2: base.textTheme.subtitle2.copyWith(
        color: primaryTextColor,
      ),
      bodyText2: base.textTheme.bodyText2.copyWith(
        color: primaryTextColor,
      ),
    );
  }
}
