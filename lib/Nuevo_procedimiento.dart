import 'package:flutter/material.dart';
import 'drawer.dart';

class NuevoProcedimientoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text('Nuevos Procedimientos', style: TextStyle(color: Colors.white)),        backgroundColor: const Color(0xFF1E2134),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text("Contenido de Nuevo Procedimiento"),
      ),
    );
  }
}
