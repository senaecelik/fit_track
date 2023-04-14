import 'package:fit_track/utils/extension/color_extension.dart';
import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instance = ColorManager._init();
  static ColorManager get instance => _instance;
  ColorManager._init();

  final Color primary = HexColor.fromHex("#0F172A");
  final Color gray = HexColor.fromHex('#B5B5B5');
  final Color grey1 = HexColor.fromHex("#505050");
  final Color buttonColor = HexColor.fromHex("#E0DDFF");

  final Color white = HexColor.fromHex("#FFFFFF");
  final Color black = HexColor.fromHex("#000000");
  final Color redColor = HexColor.fromHex("#ED5E68");
}
