import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/screens/home/components/categories.dart';

void main() {
  testWidgets('Teste do widget Categories', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Categories(),
        ),
      ),
    );

    // Verifica se 'Todas as Categorias' está sendo exibido
    expect(find.text('Todas as Categorias'), findsOneWidget);
  });
}
