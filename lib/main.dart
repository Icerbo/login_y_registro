import 'package:flutter/material.dart';
import 'package:login_y_registro/LoginScreen.dart';
import 'package:login_y_registro/RegisterScreen.dart';
import 'package:login_y_registro/WelcomeScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Icerprueba111',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/registro': (context) => const RegisterScreen(),
        '/bienvenida': (context) => WelcomeScreen(correo: '',),
      },
    );
  }
}
