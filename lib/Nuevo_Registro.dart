import 'package:flutter/material.dart';
import 'drawer.dart';
import 'index.dart'; // Importar donde está definida la lista de registros

class NuevoRegistroScreen extends StatefulWidget {
  @override
  _NuevoRegistroScreenState createState() => _NuevoRegistroScreenState();
}

class _NuevoRegistroScreenState extends State<NuevoRegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _employeeNumberController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _doctorController = TextEditingController();
  final _procedureController = TextEditingController();
  final _consultationDateController = TextEditingController();
  final _reviewDateController = TextEditingController();
  final _statusController = TextEditingController();

  void _addNewRecord() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        procedures.add(
          MedicalProcedure(
            id: procedures.length + 1,
            employeeNumber: _employeeNumberController.text,
            description: _descriptionController.text,
            doctor: _doctorController.text,
            medicalProcedure: _procedureController.text,
            consultationDate: _consultationDateController.text,
            reviewDate: _reviewDateController.text,
            status: _statusController.text,
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
        title: const Text('Nuevo Registro', style: TextStyle(color: Colors.white)),
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
                controller: _employeeNumberController,
                decoration: const InputDecoration(labelText: 'Número de Empleado'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el número de empleado';
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
              TextFormField(
                controller: _doctorController,
                decoration: const InputDecoration(labelText: 'Doctor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre del doctor';
                  }
                  return null;
                },
              ),
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
                controller: _consultationDateController,
                decoration: const InputDecoration(labelText: 'Fecha de Consulta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la fecha de consulta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _reviewDateController,
                decoration: const InputDecoration(labelText: 'Fecha de Revisión'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la fecha de revisión';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _statusController,
                decoration: const InputDecoration(labelText: 'Estado'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el estado';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addNewRecord,
                child: const Text('Agregar Registro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
