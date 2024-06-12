import 'package:flutter/material.dart';
import '../functions/api_functions.dart'; // Importar servicio de autenticación

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numeroEmpleadoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  String _mensajeError = "";

  Future<void> _iniciarSesion() async {
    final numeroEmpleado = _numeroEmpleadoController.text;
    final contrasena = _contrasenaController.text;

    final resultado =
        await AuthenticationService().iniciarSesion(numeroEmpleado, contrasena);

    if (resultado != null) {
      // La autenticación fue exitosa
      // Navega a la pantalla principal o realiza la acción correspondiente
      Navigator.pushReplacementNamed(context, '/ pantallaPrincipal');
    } else {
      // La autenticación falló
      // Muestra un mensaje de error al usuario
      setState(() {
        _mensajeError =
            'Numero de empleado o Contraseña incorrecta. Por favor, inténtalo de nuevo.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // Change from Form to Column
        children: [
          // Add your image widget here
          Image.asset(
            'assets/LogoMefasa.png', // Replace with your image path
            width: 300, // Adjust width and height as needed
            height: 200,
          ),
          const SizedBox(height: 20), // Add spacing between image and form
          Form(
            // Reintroduce the Form element
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _numeroEmpleadoController,
                    decoration:
                        const InputDecoration(labelText: 'Numero de empleado'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa tu número de empleado';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _contrasenaController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Contraseña'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingresa tu contraseña';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 2, 44, 64),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _iniciarSesion();
                      }
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                  Text(_mensajeError, style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
