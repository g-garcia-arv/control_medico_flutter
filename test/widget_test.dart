import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:control_medico/main.dart';

void main() {
  testWidgets('Verify initial UI elements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the initial UI elements are present.
    expect(find.text('Número de Empleado'), findsOneWidget);
    expect(find.text('Contraseña'), findsOneWidget);
    expect(find.text('Iniciar Sesión'), findsOneWidget);
  });

  testWidgets('Login process test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Enter text in the employee number field
    await tester.enterText(find.byType(TextFormField).at(0), '123456');

    // Enter text in the password field
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');

    // Tap the login button
    await tester.tap(find.text('Iniciar Sesión'));

    // Wait for the widgets to rebuild
    await tester.pumpAndSettle();

    // Verify that we are now on the UserListScreen by checking for a specific widget from that screen
    expect(find.text('User List'), findsOneWidget);
  });
}
