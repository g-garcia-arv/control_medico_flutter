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
    doctor: "Dr. Pacheco",
    medicalProcedure: "Revisión general",
    consultationDate: "2023-06-01",
    reviewDate: "2023-06-15",
    status: "Completado",
  ),
  MedicalProcedure(
    id: 2,
    employeeNumber: "67890",
    description: "Descripción",
    doctor: "Dra. 123",
    medicalProcedure: "Consulta en algo",
    consultationDate: "2023-06-05",
    reviewDate: "2023-06-20",
    status: "Pendiente",
  ),
  // Agrega más procedimientos aquí
];

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

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
      backgroundColor: const Color(0xFFB0BEC5), 
      appBar: AppBar(
        title: const Text("Registros", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E2134), 
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProcedureSearchDelegate(onSearch: _filterProcedures),
              );
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
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

  const ProcedureCard({super.key, 
    required this.procedure,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Color de fondo blanco para las cartas
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Empleado: ${procedure.employeeNumber}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xFF1E2134), // Texto de color azul oscuro
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text("Descripción: ${procedure.description}", style: TextStyle(color: Colors.black)),
                      Text("Médico: ${procedure.doctor}", style: TextStyle(color: Colors.black)),
                      Text("Fecha de Consulta: ${procedure.consultationDate}", style: TextStyle(color: Colors.black)),
                      Text("Estado: ${procedure.status}", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: const Color(0xFF1E2134)),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
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
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xFF1E2134), // Azul más oscuro y fuerte para el encabezado del drawer
            ),
            child: const Text(
              'Mefasa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: const Color.fromARGB(255, 0, 0, 0)), // Icono de color blanco
            title: const Text('Tabla', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: const Color.fromARGB(255, 0, 0, 0)), // Icono de color blanco
            title: const Text('Perfil', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Color.fromARGB(255, 0, 0, 0)), // Icono de color blanco
            title: const Text('Ajustes', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: const Color.fromARGB(255, 0, 0, 0)), // Icono de color blanco
            title: const Text('Logout', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
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
        icon: const Icon(Icons.clear, color: Colors.white),
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
      icon: const Icon(Icons.arrow_back, color: Colors.white),
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

void main() {
  runApp(MaterialApp(
    home: UserListScreen(),
  ));
}
