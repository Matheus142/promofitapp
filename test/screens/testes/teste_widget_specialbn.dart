import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/screens/home/components/special_beneficts.dart';
//import 'package:shop_app/screens/detail_screen.dart'; // Importe a tela de detalhes da imagem

void main() {
  testWidgets('Teste do widget SpecialOffers', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SpecialOffers(),
        ),
      ),
    );

    // Verifica se o título '💊Suplementos e seus Benefícios💊' está presente
    expect(find.text('💊Suplementos e seus Benefícios💊'), findsOneWidget);

    // Verifica se há quatro cards de ofertas especiais
    expect(find.byType(GestureDetector), findsNWidgets(4));

    // Verifica se a navegação ocorre ao tocar em um card de oferta especial
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();

  });
}
