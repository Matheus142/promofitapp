// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

void main() {
  testWidgets('Teste do widget SplashScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SplashScreen(),
        routes: {
          '/sign_in': (context) => SignInScreen(), // Define a rota para SignInScreen
        },
      ),
    );

    // Verifica se o PageView está sendo exibido
    expect(find.byType(PageView), findsOneWidget);

    // Verifica se o indicador de página está sendo exibido
    expect(find.byType(AnimatedContainer), findsNWidgets(3)); // Considerando 3 páginas

    // Verifica se o botão 'Continuar' está sendo exibido
    expect(find.widgetWithText(ElevatedButton, 'Continuar'), findsOneWidget);

    // Simula um clique no botão 'Continuar' e verifica a navegação
    await tester.tap(find.widgetWithText(ElevatedButton, 'Continuar'));
    await tester.pumpAndSettle(); // Aguarda a transição

    expect(find.byType(SignInScreen), findsOneWidget); // Verifica se a navegação foi para a tela de SignInScreen
  });
}
