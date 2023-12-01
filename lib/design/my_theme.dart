import 'package:flutter/material.dart';

class AppTheme {
  //
  static const String fontFamily = 'Quantico';

  //
  static const principalColor = Color.fromRGBO(46, 195, 255, 1);
  static const secondaryColor = Color.fromRGBO(46, 49, 146, 1);
  static const thirdColor =Color.fromRGBO(236, 237, 255, 1);
  static const beigeColor = Color.fromRGBO(243, 243, 243, 1);

  
  static const redColor = Color.fromRGBO(67, 180, 253, 1);
  static const vertbeigeColor =Color.fromRGBO(236, 249, 242, 1);
  static const vertColor = Color.fromRGBO(74, 156, 12, 1);
  
  //
   static const black = Colors.black;
  static const hintGray = Color(0xffc7c7c7);
  static const borderGray = Color(0xffDADADA);
  static const surfaceGray = Color(0xfff5f5f5);

  static const itemSurfaceGray2 = Color(0xFFD9D9D9);
  static const itemSurfaceGray2opt15 = Color(0x27D9D9D9);
  static const itemSurfaceGray3 = Color(0xFFFAFAFA);
  static const textGray = Color(0xff7E7E7E);
  static const lightGray = Color.fromRGBO(220, 230, 238, 1);


  // Définissez un ThemeData global pour votre application
  static ThemeData get themeData {
    return ThemeData(
      fontFamily: fontFamily,
      primaryColor: principalColor,
     // accentColor: accentColor,
      // Définissez d'autres paramètres de thème ici
    );
  }
}
