import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const primaryColor = Color.fromRGBO(225, 178, 142, 1.0);
const secondaryColor = Color.fromRGBO(251, 232, 203, 1);
const tertiaryColor = Color.fromRGBO(255, 242, 222, 1);

ThemeData appThemes(BuildContext ctx) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
  ).copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
