import 'package:flutter/material.dart';

class InformativoPage extends StatelessWidget {
  InformativoPage({super.key});

  final List<Map<String, String>> data = [
    {
      'image': 'assets/images/aviturismo.jpg',
      'title': 'Educación',
      'description':
          'Hemos creado una sección de educación donde podrás encontrar información sobre diferentes temas relacionados con las aves.',
    },
    {
      'image': 'assets/images/bienestar.jpg',
      'title': 'Bienestar Animal',
      'description':
          'Quito se compromete con el bienestar de las aves. En esta sección, encontrarás información sobre el cuidado y el bienestar de las aves.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 176, 138, 243),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: data.map((item) {
              return Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                        child: Image.asset(
                          item['image'] ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        title: Text(item['title'] ?? ''),
                        subtitle: Text(item['description'] ?? ''),
                      ),
                    ],
                  ));
            }).toList(),
          ),
        ));
  }
}
