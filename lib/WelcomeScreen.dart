 import 'package:flutter/material.dart';
import 'package:login_y_registro/LoginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  final String correo;

   WelcomeScreen({super.key, required this.correo});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¡Bienvenido(a), $correo', style: const TextStyle(fontSize: 24.0)),
            const SizedBox(height: 20.0),
            const SizedBox(height: 40.0),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


