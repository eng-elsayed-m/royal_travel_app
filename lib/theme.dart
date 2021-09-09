import 'package:flutter/material.dart';

class AppTheme {
  // static Map<String, Color> appColors = {
  //   "yellow-main": const Color(0xFF278DBA),
  //   "white-main": const Color(0xFFF1F6F9),
  //   "black-main": const Color(0xFF222831),
  // };
  static ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFFFF5722)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      )),
      minimumSize: MaterialStateProperty.all(
        Size(50, 30),
      ));

  static TextStyle subTitle1 = TextStyle(
      fontSize: 12, color: const Color(0xFF5457C4), fontFamily: "Kanit");
  static TextStyle bodyText1 = TextStyle(
      fontSize: 21,
      fontFamily: "Kanit",
      color: const Color(0xFF5457C4),
      fontWeight: FontWeight.bold);
  static TextStyle bodyText2 = TextStyle(
      fontSize: 17,
      color: const Color(0xFFFF5722),
      fontFamily: "Kanit",
      fontWeight: FontWeight.bold);

  static TextStyle bodyText3 = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontFamily: "Kanit",
  );
  static TextStyle bodyText4 = TextStyle(
    fontSize: 15,
    color: const Color(0xFFEF5350),
    fontFamily: "Kanit",
  );
  static TextStyle bodyText5 = TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontFamily: "Kanit",
      fontWeight: FontWeight.bold);

  //////////////////////////
  static TextStyle mainTitle = TextStyle(
      fontSize: 50,
      color: const Color(0xFF5457C4),
      // decoration: TextDecoration.underline,
      // decorationStyle: TextDecorationStyle.wavy,
      // decorationColor: const Color(0xFF278DBA),
      // decorationThickness: 4,
      fontFamily: "Righteous",
      fontWeight: FontWeight.w900);
  ///////////////////
  static TextStyle fieldText = TextStyle(
    fontSize: 20,
    letterSpacing: 3,
    color: const Color(0xFF5457C4),
    fontFamily: "Kanit",
  );
  ///////////////////
  static TextStyle buttonText = TextStyle(
    fontSize: 15,
    color: const Color(0xFFFFFFFF),
    fontFamily: "Kanit",
  );

  /////////////
  static InputDecoration inputDecoration = InputDecoration(
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          gapPadding: 3.0,
          borderSide: BorderSide(color: const Color(0xFF5457C4))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          gapPadding: 3.0,
          borderSide: BorderSide(color: const Color(0xFF5457C4))),
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35), gapPadding: 3.0));
}
