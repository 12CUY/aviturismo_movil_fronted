import 'package:app_zoologico/src/pages/informativo_page.dart';
import 'package:app_zoologico/src/widgets/carousel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Historias de Animales',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    shadows: const [
                      Shadow(
                          color: Colors.green,
                          offset: Offset(1, 1),
                          blurRadius: 1)
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            AnimalCarousel(),
            const SizedBox(
              height: 20,
            ),
            // const CardsRow(),
            InformativoPage(),
          ],
        ),
      ),
    );
  }
}
