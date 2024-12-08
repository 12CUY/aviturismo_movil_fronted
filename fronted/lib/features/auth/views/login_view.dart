import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../app/routes/app_routes.dart';

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
            // Imagen en la parte superior
            Image.asset(
              'assets/logo.png',
              height: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              '¡Bienvenido/a!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Dirección electrónica'),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Contraseña', obscureText: true),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Continuar',
              onPressed: () {
                // Aquí puedes validar el correo antes de continuar, si es necesario.
                const email =
                    'usuario@ejemplo.com'; // Este debería obtenerse del campo de texto.
                Navigator.pushNamed(
                  context,
                  AppRoutes.verification,
                  arguments:
                      email, // Pasamos el correo electrónico como argumento.
                );
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('¿Si no tienes cuenta? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}
