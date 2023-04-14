import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSizeRadius.r24,
      backgroundColor: ColorManager.instance.buttonColor,
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
