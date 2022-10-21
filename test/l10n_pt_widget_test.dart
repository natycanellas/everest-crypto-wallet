import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helper/l10n_tester.dart';
import 'helper/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets(
      'WHEN sets locale to Brazil THEN ensure it returns the correct language',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      SetupWidgetTester(
        locale: const Locale('pt', 'BR'),
        child: L10nTester(),
      ),
    );
    expect(find.text('Cripto'), findsOneWidget);
    expect(find.text('Valor total de moedas'), findsOneWidget);
    expect(find.text('Portfólio'), findsOneWidget);
    expect(find.text('Movimentações'), findsOneWidget);
    expect(find.text('Detalhes'), findsOneWidget);
    expect(find.text('Preço atual'), findsOneWidget);
    expect(find.text('Variação 24H'), findsOneWidget);
    expect(find.text('Quantidade'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('Converter moeda'), findsOneWidget);
    expect(find.text('Converter'), findsWidgets);
    expect(find.text('Saldo Disponível'), findsOneWidget);
    expect(find.text('Quanto você gostaria de converter?'), findsOneWidget);
    expect(find.text('Saldo insuficiente'), findsOneWidget);
    expect(find.text('Total estimado'), findsOneWidget);
    expect(find.text('Revisar'), findsOneWidget);
    expect(find.text('Revise os dados da sua conversão'), findsOneWidget);
    expect(find.text('Receber'), findsOneWidget);
    expect(find.text('Câmbio'), findsOneWidget);
    expect(find.text('Conversão efetuada'), findsOneWidget);
    expect(find.text('Conversão da moeda efetuada com sucesso!'), findsOneWidget);
    expect(find.text('Nenhuma movimentação foi encontrada!'), findsOneWidget);
    expect(find.text('Comprovante da Movimentação'), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
