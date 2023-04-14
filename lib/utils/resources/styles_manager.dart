import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:fit_track/utils/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.regular, color);
}

// light text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.light, color);
}

// bold text style

TextStyle getBoldStyle({double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.bold, color);
}

// semibold text style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.semiBold, color);
}
// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFamily, FontWeightManager.medium, color);
}

TextStyle getHeadStyle() {
  return _getTextStyle(FontSize.s20, FontManager.fontFamily,
      FontWeightManager.semiBold, ColorManager.instance.black);
}

TextStyle getSubHeadStyle() {
  return _getTextStyle(FontSize.s16, FontManager.fontFamily,
      FontWeightManager.regular, ColorManager.instance.gray);
}
