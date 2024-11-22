import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/custom_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
            const CustomTextField(
              label: 'Dirección electrónica',
              hintText: 'Ingresa tu correo',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'Usuario',
              hintText: 'Ingresa tu nombre de usuario',
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'Contraseña',
              hintText: 'Ingresa tu contraseña',
              obscureText: true,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Registrar',
              onPressed: () {
                // Lógica para registrar al usuario
                print('Usuario registrado');
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Lógica para ir a la vista de inicio de sesión
                Navigator.pop(context);
              },
              child: const Text('¿Ya tienes una cuenta? Inicia sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
