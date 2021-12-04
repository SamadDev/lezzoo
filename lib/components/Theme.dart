import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData colorTheme(BuildContext context) => Theme.of(context);
TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

class AppTheme {
  static const primaryColor = Colors.orange;
  static const accentColor = const Color(0xffF9FAFB);
  static const black = const Color(0xFF202020);
  static const grey700 = const Color(0xFF616161);
  static const white = Colors.white;
  static const white2 = const Color(0xffe0e0e0);
  static const green=Colors.teal;

  //light theme of the application
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: white2,
    primaryColor: primaryColor,
    textTheme: lightTextTheme,
    indicatorColor: primaryColor,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    primarySwatch: primaryColor,
    cardColor: black,
    splashColor: accentColor.withOpacity(0.5),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: grey700),
      color: white2,
      toolbarTextStyle:TextStyle (
          fontFamily: 'nrt',
      ),
      elevation: 0.3,
    ),
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline1: _headline1,
    headline2: _headline2,
    headline3: _headline3,
    headline4: _headline4,
    headline5: _headline5,
    headline6: _headline6,
    subtitle1: _subtitle1,
    subtitle2: _subtitle2,
    bodyText1: _bodyText1,
    bodyText2: _bodyText2,
    button: _button,
    caption: _caption,

  );

  static final TextStyle _headline1 = TextStyle(
    color: black,
    fontWeight: FontWeight.w300,
    fontFamily: 'nrt',
    fontSize: 60,
  );
  static final TextStyle _headline2 = TextStyle(
    color: black,
    fontWeight: FontWeight.w400,
    fontFamily: 'nrt',
    fontSize: 48,
  );
  static final TextStyle _headline3 = TextStyle(
    color: black,
    fontWeight: FontWeight.w400,
    fontFamily: 'nrt',
    fontSize: 34,
  );
  static final TextStyle _headline4 = TextStyle(
    color: black,
    fontWeight: FontWeight.w400,
    fontFamily: 'nrt',
    fontSize: 28,
  );
  static final TextStyle _headline5 = TextStyle(
    color: black,
    fontWeight: FontWeight.w400,
    fontFamily: 'nrt',
    fontSize: 24,
  );
  static final TextStyle _headline6 = TextStyle(
    color: black,
    fontWeight: FontWeight.w500,
    fontFamily: 'nrt',
    fontSize: 20,
  );

  static final TextStyle _subtitle1 = TextStyle(
    color: black,
    fontWeight: FontWeight.normal,
    fontFamily: 'nrt',
    fontSize: 16,
  );
  static final TextStyle _subtitle2 = TextStyle(
    color: black,
    fontWeight: FontWeight.normal,
    fontFamily: 'nrt',
    fontSize: 14,
  );

  static final TextStyle _bodyText1 = TextStyle(
    color: black,
    fontWeight: FontWeight.normal,
    fontFamily: 'nrt',
    fontSize: 18,
  );

  static final TextStyle _bodyText2 = TextStyle(
    color: black,
    fontWeight: FontWeight.bold,
    fontFamily: 'nrt',
    fontSize: 16,
  );
  static final TextStyle _button = TextStyle(
    color: black,
    fontWeight: FontWeight.bold,
    fontFamily: 'nrt',
    fontSize: 12,
  );
  static final TextStyle _caption = TextStyle(
    color: black,
    fontWeight: FontWeight.w400,
    fontFamily: 'nrt',
    fontSize: 10,
  );
}
