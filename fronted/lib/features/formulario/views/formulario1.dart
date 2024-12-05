import 'dart:io';
import 'package:flutter/material.dart';

class Formulario1View extends StatelessWidget {
  const Formulario1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtener la ruta de la imagen desde los argumentos de la ruta
    final String imagePath = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario 1'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Imagen seleccionada:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            // Mostrar la imagen seleccionada
            imagePath.isNotEmpty
                ? Image.file(
                    File(imagePath), // Mostrar la imagen usando File
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
