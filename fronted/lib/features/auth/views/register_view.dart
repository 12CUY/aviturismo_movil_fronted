import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../app/routes/app_routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> registerUser() async {
    final url = Uri.parse('http://localhost:3000/usuario/register'); // URL de tu backend
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'correo': _emailController.text,
        'nombre': _nameController.text,
        'contrasena': _passwordController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Si la respuesta es exitosa
      print('Usuario registrado exitosamente');
    } else {
      print('Error al registrar el usuario');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Regístrate!'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Realice todos los campos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CustomTextField(
              label: 'Dirección electrónica',
              hintText: 'Ingresa tu correo',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Usuario',
              hintText: 'Ingresa tu nombre de usuario',
              controller: _nameController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Contraseña',
              hintText: 'Ingresa tu contraseña',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Registrar',
              onPressed: () {
                registerUser(); // Llama a la función de registro
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Navegar a la vista de registro
              },
              child: const Text('¿Ya tienes una cuenta? Inicia sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
