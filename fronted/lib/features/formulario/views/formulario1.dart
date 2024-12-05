import 'package:flutter/material.dart';

class FormularioView1 extends StatelessWidget {
  const FormularioView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('formulario1'),
      ),
      body: Center(
        child: const Text('Vista formulario1'),
      ),
    );
  }
}
