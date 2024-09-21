import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final Color indicatorColor; // Добавляем параметр для цвета индикатора

  const LoadingDialog({Key? key, this.indicatorColor = Colors.blue}) : super(key: key); // Задаем значение по умолчанию

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(indicatorColor), // Устанавливаем цвет
          ),
          const SizedBox(width: 20),
          const Text("Загрузка..."),
        ],
      ),
    );
  }
}
