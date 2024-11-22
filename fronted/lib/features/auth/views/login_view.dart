// # Vista de inicio de sesión
import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              '¡Bienvenido/a!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CustomTextField(label: 'Dirección electrónica'),
            const SizedBox(height: 16),
            CustomTextField(label: 'Contraseña', obscureText: true),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Continuar',
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}
