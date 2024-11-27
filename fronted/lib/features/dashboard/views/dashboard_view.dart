// # Vista principal (pantalla de inicio)
import 'package:flutter/material.dart';
import 'package:fronted/app/routes/app_routes.dart';
import '../../bird/widgets/bird_card.dart'; // Tarjetas de aves

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/logo.png', // Ruta de la imagen
            width: 24,                      // Ajusta el tamaño de la imagen
            height: 24,
          ),
          onPressed: () {
          Navigator.pushNamed(context, '/dashboard');
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Bienvenida ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Emilia hxg',
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '¿Qué te gustaría aprender?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BirdCard(
                  imagePath: 'assets/logo.png',
                  birdName: 'Loro rojo',
                ),
                BirdCard(
                  imagePath: 'assets/logo.png',
                  birdName: 'Loro rosa',
                ),
                BirdCard(
                  imagePath: 'assets/logo.png',
                  birdName: 'Loro verde',
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Toma o sube una foto',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.birdCapture); // Navega a la vista de captura
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('foto'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listado de aves',
          ),
        ],
      ),
    );
  }
}
