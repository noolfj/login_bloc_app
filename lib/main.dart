import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'api/auth_service.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth BLoC App',
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => LoginBloc(authService: AuthService()),
              child: LoginScreen(),
            ),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
