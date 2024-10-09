import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Color primaryColor = const Color.fromRGBO(17, 39, 99, 1);
Color backGroundColor = const Color.fromRGBO(7, 14, 43, 1);
Color textColor = const Color.fromRGBO(249, 199, 38, 1);
Color boardColor = const Color.fromRGBO(7, 63, 81, 1);
Color tileColor = const Color.fromRGBO(119, 153, 163, 1);
Color tileColor2 = const Color.fromRGBO(228,242,241, 1);
Color tileColor4 = const Color.fromRGBO(238,223,200, 1);
Color tileColor8 = const Color.fromRGBO(242,177,121, 1);
Color tileColor16 = const Color.fromRGBO(245,149,99, 1);
Color tileColor32 = const Color.fromRGBO(245,124,95, 1);
Color tileColor64 = const Color.fromRGBO(246,93,59, 1);
Color tileColor128 = const Color.fromRGBO(237,206,113, 1);
Color tileColor256 = const Color.fromRGBO(237,204,97, 1);
Color tileColor512 = const Color.fromRGBO(236,200,80, 1);
Color tileColor1024 = const Color.fromRGBO(237,197,63, 1);
Color tileColor2048 = const Color.fromRGBO(238,194,46, 1);


ThemeData appTheme() {
  return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backGroundColor,
      appBarTheme: AppBarTheme(
          color: primaryColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.josefinSans().fontFamily,
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: textColor,
          )
      ),

      textTheme: TextTheme(
        headlineSmall: GoogleFonts.josefinSans(fontSize: 16, color: Colors.white),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(textColor),
          iconSize: MaterialStateProperty.all(40),
        )
      ),
  );
}

BoxDecoration boxDecorationForScore() {
  return BoxDecoration(
    color: primaryColor,
    borderRadius: BorderRadius.circular(40),
  );
}

TextStyle scoreStyle() {
  return GoogleFonts.josefinSans(
    color: textColor,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
}

BoxDecoration boxDecorationForBoard() {
  return BoxDecoration(
    color: boardColor,
    borderRadius: BorderRadius.circular(20),
  );
}

BoxDecoration boxDecorationForTile(int value) {
  Color color = tileColorAndSize(value).$1;
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(10),
  );
}

TextStyle tileStyle(int value) {
  double size = tileColorAndSize(value).$2;
  return GoogleFonts.josefinSans(color: boardColor, fontSize: size, fontWeight: FontWeight.bold);
}

(Color, double) tileColorAndSize(int value) {
  Color color = tileColor;
  double size = 0;
  switch (value) {
    case 2:
      size = 52;
      color = tileColor2;
      break;
    case 4:
      size = 52;
      color = tileColor4;
      break;
    case 8:
      size = 52;
      color = tileColor8;
      break;
    case 16:
      size = 52;
      color = tileColor16;
      break;
    case 32:
      size = 52;
      color = tileColor32;
      break;
    case 64:
      size = 52;
      color = tileColor64;
      break;
    case 128:
      size = 48;
      color = tileColor128;
      break;
    case 256:
      size = 48;
      color = tileColor256;
      break;
    case 512:
      size = 48;
      color = tileColor512;
      break;
    case 1024:
      size = 36;
      color = tileColor1024;
      break;
    case 2048:
      size = 34;
      color = tileColor2048;
      break;
  }
  return (color, size);
}