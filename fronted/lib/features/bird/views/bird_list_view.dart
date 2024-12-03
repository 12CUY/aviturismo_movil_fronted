// # Vista para tomar/subir foto de aves
import 'package:flutter/material.dart';

class BirdListView extends StatelessWidget {
  const BirdListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Aves'),
      ),
      body: Center(
        child: Text('Aquí va el contenido del listado de aves'),
      ),
    );
  }
}
