import 'package:flutter/material.dart';
import 'drawer.dart';

class MedicalProcedure {
  final int id;
  final String medicalProcedure;
  final String description;

  MedicalProcedure({
    required this.id,
    required this.medicalProcedure,
    required this.description,
  });
}

List<MedicalProcedure> procedures = [
  MedicalProcedure(
    id: 1,
    medicalProcedure: "Revisión ",
    description: "uchotecto mucho texto blablabal muchotecto mucho texto blablabal muchotecto mucho texto blab.",
  ),
  MedicalProcedure(
    id: 2,
    medicalProcedure: "Se enferemo ",
    description: "uchotecto mucho texto blablabal muchotecto mucho texto blablabal muchotecto mucho texto blab.",
  ),
  MedicalProcedure(
    id: 3,
    medicalProcedure: "se nos esta muriendo el pacienteo",
    description: "muchotecto mucho texto blablabal muchotecto mucho texto blablabal muchotecto mucho texto blablabal.",
  ),
    MedicalProcedure(
    id: 3,
    medicalProcedure: "se nos esta muriendo el pacienteo",
    description: "muchotecto mucho texto blablabal muchotecto mucho texto blablabal muchotecto mucho texto blablabal.",
  ),
    MedicalProcedure(
    id: 3,
    medicalProcedure: "se nos esta muriendo el pacienteo",
    description: "muchotecto mucho texto blablabal muchotecto mucho texto blablabal muchotecto mucho texto blablabal.",
  ),
    MedicalProcedure(
    id: 3,
    medicalProcedure: "se nos esta muriendo el pacienteo",
    description: "muchotecto mucho texto blablabal muchotecto mucho texto blablabal muchotecto mucho texto blablabal.",
  ),
    MedicalProcedure(
    id: 3,
    medicalProcedure: "se nos esta muriendo el pacienteo",
    description: "muchotecto mucho texto blablabal muchotecto mucho texto blablabal muchotecto mucho texto blablabal.",
  ),
    MedicalProcedure(
    id: 3,
    medicalProcedure: "se nos esta muriendo el pacienteo",
    description: "muchotecto mucho texto blablabal muchotecto mucho texto blablabal muchotecto mucho texto blablabal.",
  ),
  // Agrega más procedimientos según sea necesario
];

class ProcedimientoScreen extends StatefulWidget {
  const ProcedimientoScreen({Key? key}) : super(key: key);

  @override
  _ProcedimientoScreenState createState() => _ProcedimientoScreenState();
}

class _ProcedimientoScreenState extends State<ProcedimientoScreen> {
  List<MedicalProcedure> _filteredProcedures = procedures;

  void _filterProcedures(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProcedures = procedures;
      } else {
        _filteredProcedures = procedures.where((procedure) {
          return procedure.medicalProcedure.toLowerCase().contains(query.toLowerCase()) ||
              procedure.description.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Procedimientos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E2134),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
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
          );
        },
      ),
    );
  }
}

class ProcedureCard extends StatelessWidget {
  final MedicalProcedure procedure;

  const ProcedureCard({
    Key? key,
    required this.procedure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
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
            Text(
              "ID: ${procedure.id}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: const Color(0xFF1E2134),
              ),
            ),
            const SizedBox(height: 5),
            Text("Tipo de Procedimiento: ${procedure.medicalProcedure}", style: TextStyle(color: Colors.black)),
            Text("Descripción: ${procedure.description}", style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

class ProcedureSearchDelegate extends SearchDelegate {
  final Function(String) onSearch;

  ProcedureSearchDelegate({required this.onSearch});

  @override
  List<Widget> buildActions(BuildContext context) {
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
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
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
