import 'package:flutter/material.dart';
import 'drawer.dart';

class NuevoRegistroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nuevo Registro",
          style: TextStyle(color: Colors.white), // Cambio de color del título a blanco
        ),
        backgroundColor: const Color(0xFF1E2134),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text("Contenido de Nuevo Registro"),
      ),
    );
  }
}
