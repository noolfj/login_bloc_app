import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color fillColor;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = Colors.black, // Цвет границы по умолчанию
    this.focusedBorderColor = Colors.blue, // Цвет границы при фокусе
    this.fillColor = const Color.fromARGB(255, 255, 255, 255), // Цвет заливки
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor, // Цвет фона
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null, // Префикс-иконка
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null, // Суффикс-иконка
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0), // Скругленные углы
          borderSide: BorderSide(color: borderColor), // Цвет границы по умолчанию
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: borderColor), // Цвет границы
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: focusedBorderColor, width: 2), // Цвет границы при фокусе
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Внутренние отступы
      ),
    );
  }
}
