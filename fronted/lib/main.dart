import 'package:flutter/material.dart';
import 'package:fronted/features/auth/views/login_view.dart';
import 'package:fronted/features/auth/views/register_view.dart';
import 'package:fronted/features/auth/views/verification_view.dart';
import 'package:fronted/features/bird/views/bird_list_view.dart';
import 'package:fronted/features/bird/views/perfil.dart';
import 'package:fronted/features/dashboard/views/dashboard_view.dart';
import 'package:fronted/features/formulario/views/formulario1.dart';
import 'package:fronted/shared/widgets/menu_view.dart';
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
        '/dashboard': (context) => const DashboardView(),
        '/bird-list': (context) => const BirdListView(),
        '/perfil': (context) => const PerfilView(),
        '/formulario1': (context) => const FormularioCombinadoView(),
        '/menu': (context) => const MenuView(),

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
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      // Si no hay token, redirigir a la vista de login
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retorna un contenedor vacío mientras se verifica el token
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
