import 'package:app_zoologico/src/api/animal_api.dart';
import 'package:app_zoologico/src/model/animal_model.dart';
import 'package:flutter/material.dart';

class AnimalInfoPage extends StatelessWidget {
  final String name;
  final String image;
  const AnimalInfoPage({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<AnimalInfo>(
        future: fetchAnimals(name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final animalInfo = snapshot.data!;
            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Container(
                  color: Colors.green.shade100,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          image,
                          height: 300,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: Text("Imagen no disponible")),
                        ),
                        Container(
                          color: Colors.green.shade300,
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            padding: EdgeInsets.all(16.0),
                            child: Column(children: [
                              Text('Taxonomía',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              // ...animalInfo.taxonomy.map((taxon) => ListTile(title: Text(taxon.toString()))).toList(),
                              Wrap(
                                children: [
                                  ...animalInfo.taxonomy
                                      .map((taxon) => Text(taxon.toString())),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text('Ubicaciones',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              // ...animalInfo.locations.map((location) => ListTile(title: Text(location.toString()))),
                              Wrap(children: [
                                ...animalInfo.locations
                                    .map((location) => Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                  color: Colors.green)),
                                          child: Text(location.toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                              ]),
                              SizedBox(height: 20),
                              Text('Características',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              // ...animalInfo.characteristics.map((char) => ListTile(title: Text(char.toString())))
                              Column(children: [
                                ...animalInfo.characteristics
                                    .map((char) => Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('• $char',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                              ])
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('No se encontraron datos'));
          }
        },
      ),
    );
  }
}
