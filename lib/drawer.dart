import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xFF1E2134),
            ),
            child: const Text(
              'Mefasa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            // Cambiamos el color del icono del drawer a blanco
            // El icono de tres líneas horizontales
            padding: EdgeInsets.fromLTRB(16, 48, 0, 0),
            margin: EdgeInsets.all(0),
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
          ),
          ListTile(
            leading: Icon(Icons.list, color: const Color.fromARGB(255, 0, 0, 0)),
            title: const Text('Registros', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
                    ListTile(
            leading: Icon(Icons.add, color: const Color.fromARGB(255, 0, 0, 0)),
            title: const Text('Nuevo Registro', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/nuevoRegistro');
            },
          ),
          ListTile(
            leading: Icon(Icons.list, color: const Color.fromARGB(255, 0, 0, 0)),
            title: const Text('Procedimientos', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/procedimientos');
            },
          ),
                    ListTile(
            leading: Icon(Icons.add, color: const Color.fromARGB(255, 0, 0, 0)),
            title: const Text('Nuevo Procedimiento', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/nuevoProcedimiento');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: const Color.fromARGB(255, 0, 0, 0)),
            title: const Text('Logout', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () {
              Navigator.pop(context);
              // Agregar la lógica para cerrar sesión aquí
            },
          ),
        ],
      ),
    );
  }
}
