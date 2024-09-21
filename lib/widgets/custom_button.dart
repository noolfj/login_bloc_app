import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue, // Цвет текста
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12), // Отступы внутри кнопки
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Скругленные углы
        ),
        elevation: 0, // Тень
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16, // Размер шрифта
          fontWeight: FontWeight.bold, // Жирный текст
        ),
      ),
    );
  }
}
