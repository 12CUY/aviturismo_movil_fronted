import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class FormularioCombinadoView extends StatefulWidget {
  const FormularioCombinadoView({Key? key}) : super(key: key);

  @override
  _FormularioCombinadoViewState createState() =>
      _FormularioCombinadoViewState();
}

class _FormularioCombinadoViewState extends State<FormularioCombinadoView> {
  // Variables de los menús desplegables
  String? selectedSize;
  String? selectedWingPattern;
  String? selectedWeather;
  String? selectedHabitat;
  String? selectedTailShape;
  String? selectedBeakType;

  @override
  Widget build(BuildContext context) {
    // Obtener la ruta de la imagen desde los argumentos de la ruta
    final String imagePath =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario Unificado'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Características del ave observada',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Mostrar imagen
            Center(
              child: imagePath.isNotEmpty
                  ? kIsWeb
                      ? Image.network(
                          imagePath,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(imagePath),
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
            // Campos del formulario 1
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
            const SizedBox(height: 16),
            // Campos del formulario 2
            _buildDropdown(
              label: 'Condiciones climáticas',
              value: selectedWeather,
              items: ['Soleado', 'Nublado', 'Lluvioso', 'Ventoso'],
              onChanged: (value) {
                setState(() {
                  selectedWeather = value;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              label: 'Tipo de hábitat',
              value: selectedHabitat,
              items: ['Bosque', 'Pradera', 'Montaña', 'Humedales'],
              onChanged: (value) {
                setState(() {
                  selectedHabitat = value;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              label: 'Forma de la cola',
              value: selectedTailShape,
              items: ['Recta', 'Ahusada', 'Horquillada', 'Circular'],
              onChanged: (value) {
                setState(() {
                  selectedTailShape = value;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              label: 'Tipo de pico',
              value: selectedBeakType,
              items: ['Corto', 'Largo', 'Curvado', 'Ancho'],
              onChanged: (value) {
                setState(() {
                  selectedBeakType = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Color del ave (principal)',
                filled: true,
              ),
            ),
            const SizedBox(height: 24),
            // Botón Siguiente
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                // Aquí podrías manejar el envío de datos
                Navigator.pushNamed(context, '/resultado'); // Ruta de resultado
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Guardar', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 8)
                ],
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
