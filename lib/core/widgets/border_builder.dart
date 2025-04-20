import 'package:flutter/material.dart';

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 2,
        color: Color(0xFF3A3A3A),
      ));
}