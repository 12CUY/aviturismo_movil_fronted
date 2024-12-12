import 'package:flutter/material.dart';

class CardsRow extends StatelessWidget {
  const CardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/aviturismo.jpg', // Reemplaza con la ruta de tu imagen
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'Educación',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Hemos creado varios programas educativos dirigidos a niños, jóvenes y personas mayores...',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {
                              // Acción del botón "Ver más"
                            },
                            child: const Text('Ver más'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16), // Espacio entre las cards
            Expanded(
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/bienestar.jpg', // Reemplaza con la ruta de tu imagen
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'Bienestar del ave',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Es una actividad de ecoturismo que consiste en observar e identificar aves en su hábitat natural...',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {
                              // Acción del botón "Ver más"
                            },
                            child: const Text('Ver más'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
