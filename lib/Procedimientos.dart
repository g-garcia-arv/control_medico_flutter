import 'package:flutter/material.dart';
import 'drawer.dart';

class ProcedimientoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text('Procedimiento', style: TextStyle(color: Colors.white)),        backgroundColor: const Color(0xFF1E2134),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text("Contenido de Procedimientos"),
      ),
    );
  }
}
