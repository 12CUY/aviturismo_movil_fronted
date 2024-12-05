import 'package:flutter/material.dart';
import 'package:fronted/app/routes/app_routes.dart';
import 'package:fronted/shared/widgets/menu_view.dart';
import 'package:image_picker/image_picker.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  // Método para elegir una imagen desde la galería o cámara
  Future<void> _elegirImagen(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    // Mostrar un diálogo o menú para elegir la fuente de la imagen
    final XFile? imagenSeleccionada = await _picker.pickImage(
      source: ImageSource.gallery, // O ImageSource.camera para tomar una foto
    );

    if (imagenSeleccionada != null) {
      // Navegar a Formulario1View y pasar la ruta de la imagen seleccionada
      Navigator.pushNamed(
        context,
        AppRoutes.formulario1,
        arguments: imagenSeleccionada.path, // Pasa la ruta de la imagen como argumento
      );
    } else {
      print('No se seleccionó ninguna imagen.');
    }
  }

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
                    const Text('Toma o sube una foto'),
                    const SizedBox(height: 10),
                    // Botón para tomar o subir una foto
                    ElevatedButton.icon(
                      onPressed: () {
                        _elegirImagen(context); // Pasa el contexto al método para la navegación
                      },
                      icon: const Icon(Icons.cloud_upload),
                      label: const Text('Subir Foto'),
                    ),
                  ],
                ),
              )
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
