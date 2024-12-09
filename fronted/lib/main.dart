import 'package:flutter/material.dart';
import 'package:fronted/features/auth/views/login_view.dart';
import 'package:fronted/features/auth/views/register_view.dart';
import 'package:fronted/features/auth/views/verification_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/routes/app_routes.dart';
 // Asegúrate de importar la vista correcta

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviturismo',
      initialRoute: '/',
      routes: {
        '/': (context) => CheckTokenView(),
        '/login': (context) => const LoginView(),
        '/verification': (context) => const VerificationView(),
        '/register': (context) => const RegisterView(),
        // Otras rutas
      },
    );
  }
}

class CheckTokenView extends StatefulWidget {
  @override
  _CheckTokenViewState createState() => _CheckTokenViewState();
}

class _CheckTokenViewState extends State<CheckTokenView> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      // Si hay un token válido, redirigir a la página de verificación
      Navigator.pushReplacementNamed(context, '/verification');
    } else {
      // Si no hay token, redirigir a la vista de login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retorna un contenedor vacío mientras se verifica el token
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
