import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

Future<void> loginUser() async {
  final url = Uri.parse('http://localhost:3000/usuario/login'); // Asegúrate de que esta URL sea correcta
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'correo': _emailController.text,
      'contrasena': _passwordController.text,
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {  // Asegúrate de manejar el código 201
    final data = json.decode(response.body);
    final token = data['token'];

    // Guardar el token en SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    // Verificar si el token es válido
    if (token.isNotEmpty) {
      print('Inicio de sesión exitoso');
      Navigator.pushReplacementNamed(context, '/verification'); // Redirige a la vista de verificación
    } else {
      print('Token vacío, redirigiendo a login');
    }
  } else {
    print('Error al iniciar sesión');
    print('Código de estado: ${response.statusCode}');
    print('Cuerpo de respuesta: ${response.body}');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/logo.png', height: 100),
            const SizedBox(height: 16),
            const Text(
              '¡Bienvenido/a!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Dirección electrónica',
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Contraseña',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Continuar',
              onPressed: () {
                loginUser(); // Llama a la función de inicio de sesión
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/register'); // Navegar a la vista de registro
              },
              child: const Text('¿No tienes cuenta? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}
