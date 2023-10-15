import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.white,
        scaffoldBackgroundColor: const Color(0xFFFAF1D6),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(17, 76, 95, 1),
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      );
}
