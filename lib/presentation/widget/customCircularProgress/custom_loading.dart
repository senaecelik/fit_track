import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
    
   this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      color: color ?? ColorManager.instance.white,
    );
  }
}
