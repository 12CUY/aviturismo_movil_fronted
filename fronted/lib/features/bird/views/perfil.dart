import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';
import 'package:fronted/app/routes/app_routes.dart';

class PerfilView extends StatelessWidget {
  const PerfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Perfil del usuario',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Campo de Usuario
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Text(
                    'Usuario:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8.0),
                  Text('Emilia hxg'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Campo de Email
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Text(
                    'Email:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8.0),
                  Text('emilia@yavirac.edu.ec'),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Mis publicaciones',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            // Publicaciones
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/logo.png', // Ruta de la imagen
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    const Expanded(
                      child: Text(
                        'Ave palmípeda',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Boxicons.bx_edit,
                            color: Colors.orange,
                          ),
                          onPressed: () {
                            // Acción de editar
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Boxicons.bx_trash,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            // Acción de eliminar
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Botón Cerrar Sesión
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Color de fondo del botón
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Acción al cerrar sesión
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login, // Ruta a la pantalla de login
                    (route) => false, // Elimina todas las rutas previas
                  );
                },
                child: const Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Color blanco para el texto
                    shadows: [
                      Shadow(
                        blurRadius: 4.0, // Desenfoque de la sombra
                        color: Colors.black, // Color de la sombra (negra)
                        offset: Offset(2.0, 2.0), // Desplazamiento de la sombra
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
