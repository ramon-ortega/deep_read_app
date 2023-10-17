import 'dart:developer';

import 'package:deep_read_app/config/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme().getTheme());

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;

    final newTheme =
        isDarkMode ? AppTheme().getTheme() : AppTheme().getDarkTheme();
    prefs.setBool('isDarkMode', !isDarkMode);

    log("THEME VALUE: $isDarkMode");

    emit(newTheme);
  }

  Future<void> initializeTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    log("THEME VALUE: $isDarkMode");

    if (isDarkMode) {
      log("EMITE DARK");
      emit(AppTheme().getDarkTheme());
    }
  }
}
