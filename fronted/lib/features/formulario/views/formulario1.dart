import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class Formulario1View extends StatefulWidget {
  const Formulario1View({Key? key}) : super(key: key);

  @override
  _Formulario1ViewState createState() => _Formulario1ViewState();
}

class _Formulario1ViewState extends State<Formulario1View> {
  // Variables para manejar la selección de los menús desplegables
  String? selectedSize;
  String? selectedWingPattern;

  @override
  Widget build(BuildContext context) {
    // Obtener la ruta de la imagen desde los argumentos de la ruta
    final String imagePath =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario 1'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centramos la columna
          children: [
            const Text(
              'Características del ave observada formulario #1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Mostrar la imagen seleccionada
            Center(
              child: imagePath.isNotEmpty
                  ? kIsWeb
                      // Si es en la web, usa Image.network para cargar la imagen
                      ? Image.network(
                          imagePath,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(imagePath), // Para móvil usa Image.file
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                  : Container(
                      height: 150,
                      width: 150,
                      color: Colors.grey.shade200,
                      child:
                          const Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
            ),
            const SizedBox(height: 16),
            // Campos del formulario
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre completo del observador',
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Especie del ave observada:',
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Cantidad de aves observadas',
                filled: true,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            // Dropdown para el tamaño del ave
            _buildDropdown(
              label: 'Tamaño del ave',
              value: selectedSize,
              items: ['Pequeño', 'Mediano', 'Grande'],
              onChanged: (value) {
                setState(() {
                  selectedSize = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Dropdown para el patrón de alas
            _buildDropdown(
              label: 'Patrón de alas del ave',
              value: selectedWingPattern,
              items: ['Liso', 'Rayado', 'Manchado'],
              onChanged: (value) {
                setState(() {
                  selectedWingPattern = value;
                });
              },
            ),
            const Spacer(),
            // Botón Siguiente centrado
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/formulario2');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Centra los elementos dentro del botón
                  children: const [
                    Text('Siguiente', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Centra el Dropdown
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                hint: const Text('Seleccione una opción'),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
