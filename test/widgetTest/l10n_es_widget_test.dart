import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/l10n_tester.dart';
import '../helper/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets(
      'WHEN sets locale to Spain THEN ensure it returns the correct language',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const SetupWidgetTester(
        locale: Locale('es'),
        child: L10nTester(),
      ),
    );
    expect(find.text('Cripto'), findsOneWidget);
    expect(find.text('Valor total de las monedas'), findsOneWidget);
    expect(find.text('Portafolio'), findsOneWidget);
    expect(find.text('Movimientos'), findsOneWidget);
    expect(find.text('Detalles'), findsOneWidget);
    expect(find.text('Precio actual'), findsOneWidget);
    expect(find.text('Variación 24H'), findsOneWidget);
    expect(find.text('Cantidad'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('Convertir moneda'), findsOneWidget);
    expect(find.text('Convertir'), findsWidgets);
    expect(find.text('Saldo disponible'), findsOneWidget);
    expect(find.text('¿Cuánto te gustaría convertir?'), findsOneWidget);
    expect(find.text('Fondos insuficientes'), findsOneWidget);
    expect(find.text('Total Estimado'), findsOneWidget);
    expect(find.text('Revisar'), findsOneWidget);
    expect(find.text('Revisa los datos de tu conversión'), findsOneWidget);
    expect(find.text('Recibir'), findsOneWidget);
    expect(find.text('Cambio'), findsOneWidget);
    expect(find.text('Completar conversión'), findsOneWidget);
    expect(find.text('¡Conversión de moneda completada con éxito!'), findsOneWidget);
    expect(find.text('¡No se encontró movimiento!'), findsOneWidget);
    expect(find.text('Recibo de Movimiento'), findsOneWidget);
    await tester.pumpAndSettle();
  });
}