import 'package:ai_client/app/extensions/color.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color primary = HexColor("05101A");
  static Color lightGray = HexColor("D3D3D3");
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}