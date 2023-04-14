import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SizedBoxManager {
  static final SizedBoxManager _instance = SizedBoxManager._init();
  static SizedBoxManager get instance => _instance;
  SizedBoxManager._init();

  final SizedBox sized2h = SizedBox(height: AppSizeHeight.s2);

  final SizedBox sized4h = SizedBox(height: AppSizeHeight.s4);
  final SizedBox sized6h = SizedBox(height: AppSizeHeight.s6);
  final SizedBox sized8h = SizedBox(height: AppSizeHeight.s8);

  final SizedBox sized12h = SizedBox(height: AppSizeHeight.s12);
  final SizedBox sized16h = SizedBox(height: AppSizeHeight.s16);
  final SizedBox sized20h = SizedBox(height: AppSizeHeight.s20);

  final SizedBox sized24h = SizedBox(height: AppSizeHeight.s24);
  final SizedBox sized32h = SizedBox(height: AppSizeHeight.s32);

  final SizedBox sized36h = SizedBox(height: AppSizeHeight.s36);
  final SizedBox sized40h = SizedBox(height: AppSizeHeight.s40);
  final SizedBox sized130h = SizedBox(height: AppSizeHeight.s130);

  final SizedBox sized4w = SizedBox(width: AppSizeWidth.s4);
  final SizedBox sized6w = SizedBox(width: AppSizeWidth.s6);
  final SizedBox sized12w = SizedBox(width: AppSizeWidth.s12);
  final SizedBox sized24w = SizedBox(width: AppSizeWidth.s24);
  final SizedBox sized36w = SizedBox(width: AppSizeWidth.s36);

  final SizedBox shrink = const SizedBox.shrink();
}
