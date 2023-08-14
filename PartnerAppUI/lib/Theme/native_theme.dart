import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(255, 166, 146, .1),
  100: Color.fromRGBO(255, 166, 146, .2),
  200: Color.fromRGBO(255, 166, 146, .3),
  300: Color.fromRGBO(255, 166, 146, .4),
  400: Color.fromRGBO(255, 166, 146, .5),
  500: Color.fromRGBO(255, 166, 146, .6),
  600: Color.fromRGBO(255, 166, 146, .7),
  700: Color.fromRGBO(255, 166, 146, .8),
  800: Color.fromRGBO(255, 166, 146, .9),
  900: Color.fromRGBO(255, 166, 146, 1),
};
ThemeData nativeTheme() {
  return ThemeData(
    primaryColor: Color(0xff3d4ed9),
    cursorColor: Color(0xff3d4ed9),
    fontFamily: "Avenir",
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color(0xff3d4ed9),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 20)),
    scaffoldBackgroundColor: Color(0xffffffff),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
      backgroundColor: Color(0xff9b89b9),
    )),
    iconTheme: IconThemeData(color: Color(0xff3d4ed9)),

    //primaryColor: Color(0xff3d4ed9),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(10),
      labelStyle: TextStyle(height: 1.5, color: Color(0xffACB1C0)),
      hintStyle: TextStyle(color: Color(0xff727272), fontSize: 15),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff3d4ed9),
          width: 0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE1E4E8),
        ),
      ),
      fillColor: Color(0xFFffffff),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff3d4ed9)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
    textTheme: TextTheme(
      headline3: TextStyle(color: Colors.black, fontSize: 17),
      headline4: TextStyle(color: Colors.black, fontSize: 20),
      headline5: TextStyle(color: Colors.white, fontSize: 20),
      headline6: TextStyle(color: Colors.white, fontSize: 15),
      bodyText1: TextStyle(color: Colors.black, fontSize: 15),
      button: TextStyle(fontSize: 13, color: Colors.white),
      bodyText2: TextStyle(fontSize: 15),
      subtitle1: TextStyle(color: Colors.black, fontSize: 17),
      subtitle2: TextStyle(color: Colors.black, fontSize: 13),
    ),
    primaryTextTheme: const TextTheme(
      headline4: TextStyle(color: Colors.black, fontSize: 30),
      headline5: TextStyle(color: Colors.black, fontSize: 25),
      headline6: TextStyle(color: Colors.black, fontSize: 18),
      bodyText1: TextStyle(color: Colors.black, fontSize: 13),
      button: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText2: TextStyle(
        fontSize: 13,
        color: Color(0xff727272),
      ),
    ),
    accentTextTheme: const TextTheme(
      headline5: TextStyle(color: Colors.black, fontSize: 20),
      bodyText1: TextStyle(color: Colors.black, fontSize: 17),
      bodyText2: TextStyle(color: Colors.black, fontSize: 13),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.only(top: 10, bottom: 10)),
      backgroundColor: MaterialStateProperty.all(Color(0xFF3D4ED9)),
      shadowColor: MaterialStateProperty.all(Colors.white),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      )),
      textStyle: MaterialStateProperty.all(const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
    )),
  );
}
