// ignore_for_file: prefer_const_constructors

import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:fit_track/utils/resources/string_manager.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';

class Utils {
  static String? isEmptyValidator(val) {
    if (val.isEmpty) return StringManager.instance.blank;
    return null;
  }

  static snackbar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(text),
      backgroundColor: ColorManager.instance.primary,
      elevation: AppSizeHeight.s8,
      shape: StadiumBorder(),
      duration: Duration(milliseconds: 900),
    ));
  }
}
