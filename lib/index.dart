import 'package:flutter/material.dart';
import 'user.dart'; // Asegúrate de importar la clase User

// Lista de usuarios de ejemplo
final List<User> users = [
  User(name: "John Doe", email: "john@example.com", phone: "123-456-7890"),
  User(name: "Jane Smith", email: "jane@example.com", phone: "098-765-4321"),
  // Agrega más usuarios aquí
];

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return UserCard(user: user, onDelete: () {
            // Implementar la eliminación de usuarios aquí
          }, onEdit: () {
            // Implementar la edición de usuarios aquí
          });
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  UserCard({
    required this.user,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text("Email: ${user.email}"),
            Text("Phone: ${user.phone}"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onEdit,
                  icon: Icon(Icons.edit, color: Colors.blue),
                  label: Text("Edit"),
                ),
                TextButton.icon(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: Colors.red),
                  label: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
