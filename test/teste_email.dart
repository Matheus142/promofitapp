// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/screens/sign_in/components/sign_form.dart';

void main() {
  testWidgets('Teste de validação do formulário de login', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox( // Utiliza um SizedBox para limitar o tamanho do Column
            width: 30, // Define a largura do SizedBox
            height: 50, // Define a altura do SizedBox
            child: SignForm(), // Coloca o Column dentro do SizedBox
          ),
        ),
      ),
    );

    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));

    // Insere um email válido no campo de email
    await tester.enterText(emailField, 'example@example.com');
    await tester.pump(); // Aguarda a atualização do widget

    // Insere uma senha válida no campo de senha
    await tester.enterText(passwordField, 'password123');
    await tester.pump(); // Aguarda a atualização do widget

  });
}
