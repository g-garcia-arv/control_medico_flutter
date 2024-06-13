import 'package:flutter/material.dart';
import 'index.dart';
import 'Nuevo_procedimiento.dart';
import 'Nuevo_Registro.dart';
import 'Procedimientos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control Médico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const UserListScreen(),
        '/nuevoProcedimiento': (context) => NuevoProcedimientoScreen(),
        '/nuevoRegistro': (context) => NuevoRegistroScreen(),
        '/procedimientos': (context) => ProcedimientoScreen(),
      },
    );
  }
}
