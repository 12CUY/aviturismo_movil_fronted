// # Configuración de rutas
import 'package:flutter/material.dart';
import 'package:fronted/features/dashboard/views/dashboard_view.dart';
import '../../features/auth/views/login_view.dart';
import '../../features/auth/views/register_view.dart';
import '../../features/auth/views/verification_view.dart';
import '../../features/dashboard/views/dashboard_view.dart' as dashboard;
import '../../shared/widgets/menu_view.dart' as shared;
import '../../features/bird/views/bird_list_view.dart';
// import '../../features/bird/views/bird_capture_view.dart';

// rutas

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String verification = '/verification';
  static const String dashboard = '/dashboard';
  static const String menu = '/menu';
  static const String birdList = '/bird-list';
  static const String birdCapture = '/bird-capture';

// c
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (_) => const LoginView(),
      register: (_) => const RegisterView(),
      verification: (_) => const VerificationView(),
      dashboard: (_) => const DashboardView(),
      menu: (_) => const shared.MenuView(),
      birdList: (_) => const BirdListView(),
      // birdCapture: (_) => const BirdCaptureView(),
    };
  }
}
