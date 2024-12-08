import 'package:flutter/material.dart';

class Formulario2View extends StatefulWidget {
  const Formulario2View({Key? key}) : super(key: key);

  @override
  _Formulario2ViewState createState() => _Formulario2ViewState();
}

class _Formulario2ViewState extends State<Formulario2View> {
  // Variables para manejar la selección de los menús desplegables
  String? selectedWeather;
  String? selectedHabitat;
  String? selectedTailShape;
  String? selectedBeakType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Características del ave observada'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Características del ave observada formulario # 2',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            _buildDropdown(
                'Condiciones climáticas', 'Seleccione condición climática', [
              'Soleado',
              'Nublado',
              'Lluvioso',
              'Ventoso'
            ], (value) {
              setState(() {
                selectedWeather = value;
              });
            }),
            _buildDropdown('Tipo de hábitat', 'Seleccione el hábitat', [
              'Bosque',
              'Pradera',
              'Montaña',
              'Humedales'
            ], (value) {
              setState(() {
                selectedHabitat = value;
              });
            }),
            _buildDropdown('Forma de la cola', 'Seleccione la forma', [
              'Recta',
              'Ahusada',
              'Horquillada',
              'Circular'
            ], (value) {
              setState(() {
                selectedTailShape = value;
              });
            }),
            _buildDropdown('Tipo de pico', 'Seleccione el tipo de pico', [
              'Corto',
              'Largo',
              'Curvado',
              'Ancho'
            ], (value) {
              setState(() {
                selectedBeakType = value;
              });
            }),
            _buildInputField(
                'Color del ave (principal)', 'Ingrese el color principal'),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Siguiente'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  elevation: 5, // Sombra del botón
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String hint, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _getSelectedValue(label),
                hint: Text(hint),
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  onChanged(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _getSelectedValue(String label) {
    switch (label) {
      case 'Condiciones climáticas':
        return selectedWeather;
      case 'Tipo de hábitat':
        return selectedHabitat;
      case 'Forma de la cola':
        return selectedTailShape;
      case 'Tipo de pico':
        return selectedBeakType;
      default:
        return null;
    }
  }

  Widget _buildInputField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey.shade300,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
