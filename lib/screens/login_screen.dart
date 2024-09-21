import 'package:bloc_project_app/widgets/custom_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfields.dart';
import '../widgets/custom_snackbar.dart'; // Импортируем ваш CustomSnackbar

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Фоновое изображение
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg/bg_login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Основной контент
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginFailure) {
                Navigator.of(context).pop(); // Закрыть диалог загрузки
                CustomSnackbar.show(
                    context, state.error); // Используем CustomSnackbar
              } else if (state is LoginSuccess) {
                Navigator.of(context).pop(); // Закрыть диалог загрузки
                Navigator.of(context).pushReplacementNamed('/home');
              } else if (state is LoginLoading) {
                showDialog(
                  context: context,
                  barrierDismissible:
                      false, // Запретить закрытие диалога при нажатии вне его
                  builder: (context) => LoadingDialog(),
                );
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Кастомный AppBar
                  Container(
                    padding:
                        const EdgeInsets.only(top: 50, left: 16, right: 16),
                    alignment: Alignment.center,
                    child: const Text(
                      'Авторизация',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 150),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Добро пожаловать',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomTextField(
                          controller: _emailController,
                          labelText: 'Email',
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _passwordController,
                          labelText: 'Пароль',
                          obscureText: true,
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: 'Войти',
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginButtonPressed(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // Логика для перехода на экран регистрации
                          },
                          child: const Text(
                            'Нет аккаунта? Зарегистрироваться',
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
