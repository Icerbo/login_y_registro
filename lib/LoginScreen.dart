

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_y_registro/WelcomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  final _storage = const FlutterSecureStorage();
  bool _showPassword = false; // Variable para controlar la visibilidad de la contraseña

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese un correo electrónico';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _contrasenaController,
                obscureText: _showPassword,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility, // Cambiar ícono según visibilidad
                    ),
                    onPressed: () {
                      setState(() { // Actualizar estado para mostrar/ocultar contraseña
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese una contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Registrarse'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/registro');
                    },
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    child: const Text('Iniciar sesión'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_correoController.text == 'admin@gmail.com' &&
                            _contrasenaController.text == '123456') {
                        // Enviar el nombre al usuaria
                        Navigator.pushReplacement(
                   context, MaterialPageRoute(builder: (context) => WelcomeScreen(correo: _correoController.text)),
                 );
                        } else {
                          // Muestrar mensaje de error de inicio de sesión incorrecto
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Correo o contraseña incorrectos'),
                            ),
                          );
                        }
                      }
                    

                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
