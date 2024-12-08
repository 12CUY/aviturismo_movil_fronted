// # Configuración de rutas
import 'package:flutter/material.dart';
import 'package:fronted/features/dashboard/views/dashboard_view.dart';
import '../../features/auth/views/login_view.dart';
import '../../features/auth/views/register_view.dart';
import '../../features/auth/views/verification_view.dart';
import '../../features/dashboard/views/dashboard_view.dart' as dashboard;
import '../../shared/widgets/menu_view.dart' as shared;
import '../../features/bird/views/bird_list_view.dart';
import 'package:fronted/features/bird/views/perfil.dart' as shared;
import 'package:fronted/features/formulario/views/formulario1.dart';

class AppRoutes {
    // Rutas de autenticación
  static const String login = '/login';
  static const String register = '/register';
  static const String verification = '/verification';
    // Rutas del dashboard
  static const String dashboard = '/dashboard';
  static const String menu = '/menu';
    // Rutas de aves
  static const String birdList = '/bird-list';
  static const String birdCapture = '/bird-capture';
  static const String perfil = '/perfil';
    // Rutas de formularios
  static const String formulario1 = '/formulario1';
  static const String formulario2 = '/formulario2';

// c
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (_) => const LoginView(),
      register: (_) => const RegisterView(),
      verification: (_) => const VerificationView(),
      dashboard: (_) => const DashboardView(),
      menu: (_) => const shared.MenuView(),
      birdList: (_) => const BirdListView(),
      perfil: (_) => const shared.PerfilView(),
      formulario1: (context) => const FormularioCombinadoView(),
    };
  }
}
