import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthenticationService {
  Future<dynamic> iniciarSesion(String numeroEmpleado, String contrasena) async {
    final url = Uri.parse('aqui va la url de la api apa :) ');
    final body = {'numero_de_empleado': numeroEmpleado, 'password': contrasena};
    final response = await http.post(url, body: convert.jsonEncode(body));

    if (response.statusCode == 200) {
      // Authentication successful
      // Extract relevant information from the response (e.g., token, user data)
      final responseData = convert.jsonDecode(response.body);
      // ... Use the extracted data
      return responseData;
    } else {
      // Authentication failed
      // Handle the error (e.g., display error message)
      return null;
    }
  }
}