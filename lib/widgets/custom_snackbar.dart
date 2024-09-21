import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final snackbar = OverlayEntry(
      builder: (context) => Positioned(
        top: 60, // Отступ от верхней части экрана
        left: 20,
        right: 20,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red, // Цвет фона SnackBar
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(snackbar);

    // Анимация для плавного появления
    Future.delayed(Duration(milliseconds: 100), () {
      snackbar.markNeedsBuild();
    });

    // Удаляем snackbar через 3 секунды
    Future.delayed(const Duration(seconds: 3), () {
      snackbar.remove();
    });
  }
}
