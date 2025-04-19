import 'package:flutter/material.dart';

import '../constants/app_text_styles.dart';
import 'border_builder.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.onSaved,
      this.prefixIcon});

  final String hintText;
  final TextInputType keyboardType;
  final Icon? prefixIcon;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      style: TextStyle(color: Color(0xFFE1E1E1) ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        } if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: AppTextStyles.bodyText1.copyWith(
            color: const Color(0xFF6D6D6D),
          ),
          fillColor: const Color(0xFF1E1E1E),
          filled: true,
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()),
    );
  }


}
