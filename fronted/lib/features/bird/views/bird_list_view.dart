import 'package:flutter/material.dart';

class BirdListView extends StatefulWidget {
  const BirdListView({Key? key}) : super(key: key);

  @override
  State<BirdListView> createState() => _BirdListViewState();
}

class _BirdListViewState extends State<BirdListView> {
  final List<String> birdNames = [
    'Loro',
    'Perico',
    'Cotorra',
    'Guacamayo',
    'Canario'
  ]; // Lista de nombres de aves
  List<String> filteredBirdNames = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBirdNames = birdNames; // Inicialmente mostrar todas las aves
  }

  void filterBirds(String query) {
    final filtered = birdNames
        .where((bird) => bird.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredBirdNames = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Aves'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: filterBirds,
              decoration: InputDecoration(
                hintText: 'Buscar por nombre...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredBirdNames.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Card(
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Especie de ave: ${filteredBirdNames[index]}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.pinkAccent, // Color de fondo
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Bordes redondeados
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              foregroundColor: Colors.white, // Color del texto
                            ),
                            onPressed: () {
                              // Acción al presionar el botón
                            },
                            child: const Text('click'),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
