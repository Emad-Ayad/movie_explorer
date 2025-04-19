import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import 'border_builder.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(color: Color(0xFFE1E1E1)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            obscureText = !obscureText;
            setState(() {});
          },
          icon: obscureText
              ? const Icon(
                  Icons.visibility_off,
                  color: Color(0xffC9CECF),
                )
              : const Icon(
                  Icons.visibility,
                  color: Color(0xffC9CECF),
                ),
        ),
        prefixIcon: Icon(Icons.lock_outlined),
        hintText: "******",
        hintStyle: AppTextStyles.bodyText1.copyWith(
          color: const Color(0xFF6D6D6D),
        ),
        fillColor: const Color(0xFF1E1E1E),
        filled: true,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }
}
