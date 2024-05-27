import 'package:flutter/material.dart';
import 'package:login_y_registro/WelcomeScreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  final _repetirContrasenaController = TextEditingController();
  final _storage =  const FlutterSecureStorage();
  bool _showPassword = false;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _apellidosController,
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese sus apellidos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese un correo electrónico';
                  }
                  if (!value.contains('@')) {
                    return 'Ingrese un correo electrónico válido';
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
                      setState(() { // Actualiza estado para mostrar/ocultar contraseña
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
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _repetirContrasenaController,
                obscureText: _showPassword,
                decoration: InputDecoration(
                  labelText: 'Repetir contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility, // Cambiar ícono según visibilidad
                    ),
                    onPressed: () {
                      setState(() { // Actualiza estado para mostrar/ocultar contraseña
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Repita la contraseña';
                  }
                  if (value != _contrasenaController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                child: const Text('Registrarse'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Registrar los datos del usuario en una base de datos o almacenamiento local
                    // Muestrar un mensaje de registro exitoso
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Usuario registrado correctamente'),
                      ),
                    );
                    // Navega a la pantalla de bienvenida
                    
                    var correo = _correoController.text;
                   Navigator.pushReplacement(
                   context, MaterialPageRoute(builder: (context) => WelcomeScreen(correo: correo)),
                 );
                }
               },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
