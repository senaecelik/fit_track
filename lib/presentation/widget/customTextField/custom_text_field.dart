import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.obscure = false,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool? obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscure ?? false,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
