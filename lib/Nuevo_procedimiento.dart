import 'package:flutter/material.dart';
import 'drawer.dart';
import 'Procedimientos.dart'; // Importar donde está definida la lista de procedimientos

class NuevoProcedimientoScreen extends StatefulWidget {
  @override
  _NuevoProcedimientoScreenState createState() => _NuevoProcedimientoScreenState();
}

class _NuevoProcedimientoScreenState extends State<NuevoProcedimientoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _procedureController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _addNewProcedure() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        procedures.add(
          MedicalProcedure(
            id: procedures.length + 1,
            medicalProcedure: _procedureController.text,
            description: _descriptionController.text,
          ),
        );
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Procedimiento', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E2134),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _procedureController,
                decoration: const InputDecoration(labelText: 'Procedimiento Médico'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el procedimiento médico';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la descripción';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addNewProcedure,
                child: const Text('Agregar Procedimiento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
