import 'package:flutter/material.dart';
import 'package:fronted/app/routes/app_routes.dart';
import 'package:fronted/shared/widgets/menu_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AviTourism'),
        centerTitle: true,
      ),
      drawer: MenuView(), // Menú lateral
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildWelcomeCard(), // Tarjeta de bienvenida
              SizedBox(height: 20),
              Center(
                child: Text(
                  '¿Qué te gustaría aprender?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _buildBirdCard('Loro rojo', 'assets/logo.png'),
                  _buildBirdCard('Loro rosa', 'assets/logo.png'),
                  _buildBirdCard('Loro rosa', 'assets/logo.png'),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text('Toma o sube una foto'),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Lógica para tomar o subir una foto
                      },
                      icon: Icon(Icons.camera_alt),
                      label: Text('Foto'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[50], // Fondo rosado suave
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 4), // Sombra ligera
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Bienvenid@',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200], // Fondo gris claro
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(2, 2), // Sombra alrededor del texto
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBirdCard(String title, String imageAsset) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.blueAccent, width: 2),
      ),
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageAsset,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Lógica para mostrar más información sobre el ave
              },
              child: Text('Saber más'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
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
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              // Lógica para navegar al inicio
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Listado de Aves'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.birdList);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar sesión'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.login, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
