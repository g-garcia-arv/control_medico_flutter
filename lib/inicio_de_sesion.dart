import 'package:flutter/material.dart';
import 'index.dart'; // Importa la pantalla UserListScreen

class InicioSesion extends StatefulWidget {
  const InicioSesion({super.key});

  @override
  _InicioSesionState createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  final _formKey = GlobalKey<FormState>();
  final _numeroEmpleadoController = TextEditingController();
  final _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Use a Stack to position the image and form widgets
        children: <Widget>[
          // Imagen circular en la parte superior
          Positioned(
            top: 40.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 200.0,
              child: Center(
                child: Image(
                  image:
                      AssetImage('assets/LogoMefasa.png'), // Imagen del avatar
                  fit: BoxFit.contain, // Ajusta la imagen dentro del contenedor
                ),
              ),
            ),
          ),

          // Contenedor con el formulario de inicio de sesión
          Positioned(
            top: 240.0, // Posiciona el formulario en la parte inferior
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Form(
                      key: _formKey, // Añadimos el GlobalKey al formulario
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Número de Empleado',
                            ),
                            controller: _numeroEmpleadoController,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Ingrese su número de empleado';
                              }
                              // Add more specific validation if needed
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                            ),
                            controller: _contrasenaController,
                            obscureText: true, // Mask password characters
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Ingrese su contraseña';
                              }
                              // Add more specific validation if needed
                              return null;
                            },
                          ),
                          SizedBox(height: 32.0),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                // Replace with your login logic (backend integration)
                                // e.g., call a login API or use Firebase Authentication
                                print(
                                    'Login initiated with username: ${_numeroEmpleadoController.text} and password: ${_contrasenaController.text}');
                                // Handle successful/unsuccessful login attempts
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserListScreen(),
                                  ),
                                );
                              }
                            },
                            child: Text('Iniciar Sesión'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
