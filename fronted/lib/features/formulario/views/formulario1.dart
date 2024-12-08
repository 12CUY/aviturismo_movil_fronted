import 'package:flutter/material.dart';
import 'dart:io'; // Importar File para plataformas móviles
import 'package:flutter/foundation.dart' show kIsWeb; // Importar kIsWeb

class Formulario1View extends StatelessWidget {
  const Formulario1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtener la ruta de la imagen desde los argumentos de la ruta
    final String imagePath = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario 1'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Imagen seleccionada:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            // Mostrar la imagen seleccionada
            imagePath.isNotEmpty
                ? kIsWeb
                    // Si es en la web, usa Image.network para cargar la imagen
                    ? Image.network(
                        imagePath, // URL local del archivo en la web
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(imagePath), // Para móvil usa Image.file
                        height: 200,
                        fit: BoxFit.cover,
                      )
                : Container(),
          ],
        ),
      ),
    );
  }
}
