import 'package:flutter/material.dart';
import 'dart:html' as html; // Import para trabajar con archivos en la Web
import 'package:fronted/app/routes/app_routes.dart';
import 'package:fronted/shared/widgets/menu_view.dart';
import 'package:image_picker/image_picker.dart'; // Para plataformas móviles
import 'package:image_picker_web/image_picker_web.dart'; // Para plataformas web
import 'package:flutter/foundation.dart' show kIsWeb; // Import `kIsWeb` para detectar la plataforma

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  // Método para elegir una imagen desde la galería o cámara
  Future<void> _elegirImagen(BuildContext context) async {
    XFile? imagenSeleccionada;

    if (kIsWeb) {
      // Para la web, usar image_picker_web
      final result = await ImagePickerWeb.getImage(outputType: ImageType.file);

      if (result != null) {
        // Convertir el archivo html.File en un XFile
        final html.File file = result as html.File;
        // Crear una URL local para el archivo en la web
        final imageUrl = html.Url.createObjectUrlFromBlob(file);
        imagenSeleccionada = XFile(imageUrl); // Usar la URL en lugar de la ruta
      }
    } else {
      // Para móvil, usar image_picker
      final ImagePicker picker = ImagePicker();
      imagenSeleccionada = await picker.pickImage(
        source: ImageSource.gallery, // O ImageSource.camera para tomar una foto
      );
    }

    if (imagenSeleccionada != null) {
      // Navegar a Formulario1View y pasar la ruta de la imagen seleccionada
      Navigator.pushNamed(
        context,
        AppRoutes.formulario1,
        arguments: imagenSeleccionada.path, // Pasar la ruta de la imagen como argumento
      );
    } else {
      print('No se seleccionó ninguna imagen.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AviTourism'),
        centerTitle: true,
      ),
      drawer: const MenuView(), // Menú lateral
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildWelcomeCard(), // Tarjeta de bienvenida
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  '¿Qué te gustaría aprender?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
            offset: const Offset(0, 4), // Sombra ligera
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Expanded(
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
                  offset: const Offset(2, 2), // Sombra alrededor del texto
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
        side: const BorderSide(color: Colors.blueAccent, width: 2),
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
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Lógica para mostrar más información sobre el ave
              },
              child: const Text('Saber más'),
            ),
          ],
        ),
      ),
    );
  }
}
