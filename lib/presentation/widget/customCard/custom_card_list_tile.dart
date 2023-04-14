import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:fit_track/utils/resources/styles_manager.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CustomCardListTile extends StatelessWidget {
  const CustomCardListTile({
    super.key,
    required this.title,
    this.onTap,
    this.leading, this.trailing,
  });
  final String title;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.instance.gray,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizeRadius.r14)),
      child: ListTile(
        onTap: onTap,
        trailing: trailing,
        leading: leading,
        title: Text(
          title,
          style: getBoldStyle(color: ColorManager.instance.black),
        ),
      ),
    );
  }
}
