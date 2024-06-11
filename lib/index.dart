import 'package:flutter/material.dart';

// Nueva clase para representar los procedimientos médicos
class MedicalProcedure {
  final int id;
  final String employeeNumber;
  final String description;
  final String doctor;
  final String medicalProcedure;
  final String consultationDate;
  final String reviewDate;
  final String status;

  MedicalProcedure({
    required this.id,
    required this.employeeNumber,
    required this.description,
    required this.doctor,
    required this.medicalProcedure,
    required this.consultationDate,
    required this.reviewDate,
    required this.status,
  });
}

// Lista de procedimientos de ejemplo (se eliminará más adelante)
final List<MedicalProcedure> procedures = [
  MedicalProcedure(
    id: 1,
    employeeNumber: "12345",
    description: "Cosas importantes",
    doctor: "Dr.pacheco",
    medicalProcedure: "Revisión general",
    consultationDate: "2023-06-01",
    reviewDate: "2023-06-15",
    status: "Completado",
  ),
  MedicalProcedure(
    id: 2,
    employeeNumber: "67890",
    description: "descripcion",
    doctor: "Dra.123",
    medicalProcedure: "Consulta en algo",
    consultationDate: "2023-06-05",
    reviewDate: "2023-06-20",
    status: "Pendiente",
  ),
  MedicalProcedure(
    id: 1,
    employeeNumber: "12345",
    description: "Cosas importantes",
    doctor: "Dr.pacheco",
    medicalProcedure: "Revisión general",
    consultationDate: "2023-06-01",
    reviewDate: "2023-06-15",
    status: "Completado",
  ),
  MedicalProcedure(
    id: 1,
    employeeNumber: "12345",
    description: "Cosas importantes",
    doctor: "Dr.pacheco",
    medicalProcedure: "Revisión general",
    consultationDate: "2023-06-01",
    reviewDate: "2023-06-15",
    status: "Completado",
  ),
  // Agrega más procedimientos aquí
];

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<MedicalProcedure> _filteredProcedures = procedures;

  void _filterProcedures(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProcedures = procedures;
      } else {
        _filteredProcedures = procedures.where((procedure) {
          return procedure.employeeNumber.contains(query) ||
              procedure.description.toLowerCase().contains(query.toLowerCase()) ||
              procedure.doctor.toLowerCase().contains(query.toLowerCase()) ||
              procedure.medicalProcedure.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Procedimientos"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProcedureSearchDelegate(onSearch: _filterProcedures),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: _filteredProcedures.length,
        itemBuilder: (context, index) {
          final procedure = _filteredProcedures[index];
          return ProcedureCard(
            procedure: procedure,
            onDelete: () {
              setState(() {
                _filteredProcedures.remove(procedure);
                procedures.remove(procedure); 
              });
            },
            onEdit: () {
              // Implementar la edición de procedimientos aquí (más adelante)
              print('Editar ${procedure.description}');
            },
          );
        },
      ),
    );
  }
}

class ProcedureCard extends StatelessWidget {
  final MedicalProcedure procedure;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  ProcedureCard({
    required this.procedure,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Text(procedure.employeeNumber[0]),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Empleado: ${procedure.employeeNumber}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("Descripción: ${procedure.description}"),
                  Text("Médico: ${procedure.doctor}"),
                  Text("Fecha de Consulta: ${procedure.consultationDate}"),
                  Text("Estado: ${procedure.status}"),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Mefasa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Tabla'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ajustes'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class ProcedureSearchDelegate extends SearchDelegate {
  final Function(String) onSearch;

  ProcedureSearchDelegate({required this.onSearch});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          onSearch(query);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    onSearch(query);
    return Container();
  }
}
