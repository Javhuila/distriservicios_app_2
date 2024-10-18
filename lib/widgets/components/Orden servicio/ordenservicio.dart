import 'package:flutter/material.dart';

class OrdenServicio extends StatelessWidget {
  const OrdenServicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: const Center(
        child: Text('Orden de Servicio'),
      ),
    );
  }
}
