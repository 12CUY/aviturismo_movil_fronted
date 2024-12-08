import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'Emilia hxg',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'emilia@example.com',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              // Lógica para navegar al inicio
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'), 
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.perfil);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Listado de Aves'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.birdList);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              // Lógica para cerrar sesión
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
