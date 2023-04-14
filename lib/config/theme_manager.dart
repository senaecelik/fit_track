import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:fit_track/utils/resources/font_manager.dart';
import 'package:fit_track/utils/resources/styles_manager.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ThemeDatas {
  ThemeData getApplicationTheme() {
    return ThemeData(
      // colors of the app

      primaryColor: ColorManager.instance.primary,
      primaryColorLight: ColorManager.instance.primary,
      primaryColorDark: ColorManager.instance.primary,
      disabledColor: ColorManager.instance.grey1,

      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: ColorManager.instance.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.instance.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizeRadius.r14)),
          textStyle: getSemiBoldStyle(color: ColorManager.instance.white),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: ColorManager.instance.black,
              textStyle: getSemiBoldStyle(color: ColorManager.instance.black))),

      appBarTheme: AppBarTheme(
        titleSpacing: 0,
        titleTextStyle: getBoldStyle(
            color: ColorManager.instance.white, fontSize: FontSize.s24),
        backgroundColor: ColorManager.instance.primary,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorManager.instance.gray,
        hintStyle: getRegularStyle(color: ColorManager.instance.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeRadius.r18),
            borderSide: BorderSide(color: ColorManager.instance.primary)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeRadius.r18),
            borderSide: BorderSide(color: ColorManager.instance.primary)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizeRadius.r18),
          borderSide: BorderSide(color: ColorManager.instance.gray),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.instance.redColor),
          borderRadius: BorderRadius.circular(AppSizeRadius.r18),
        ),
      ),
    );
  }
}
