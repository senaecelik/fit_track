import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.widget,
    required this.onPressed,
  });

  final Widget widget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50, child: ElevatedButton(onPressed: onPressed, child: widget));
  }
}
