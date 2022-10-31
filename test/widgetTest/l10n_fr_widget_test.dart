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
      'WHEN sets locale to France THEN ensure it returns the correct language',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const SetupWidgetTester(
        locale: Locale('fr'),
        child: L10nTester(),
      ),
    );
    expect(find.text('Crypto'), findsOneWidget);
    expect(find.text('Valeur totale des pièces de monnaie'), findsOneWidget);
    expect(find.text('Portefeuille'), findsOneWidget);
    expect(find.text('Mouvements'), findsOneWidget);
    expect(find.text('Détails'), findsOneWidget);
    expect(find.text('Prix ​​actuel'), findsOneWidget);
    expect(find.text('24H Variation'), findsOneWidget);
    expect(find.text('Quantité'), findsOneWidget);
    expect(find.text('Valeur'), findsOneWidget);
    expect(find.text('Convertir la monnaie'), findsOneWidget);
    expect(find.text('Convertir'), findsWidgets);
    expect(find.text('Solde disponible'), findsOneWidget);
    expect(find.text('Combien souhaitez-vous convertir?'), findsOneWidget);
    expect(find.text('Fonds insuffisants'), findsOneWidget);
    expect(find.text('Total estimé'), findsOneWidget);
    expect(find.text('Revue'), findsOneWidget);
    expect(find.text('Passez en revue les données de votre conversion'), findsOneWidget);
    expect(find.text('Recevoir'), findsOneWidget);
    expect(find.text('Taux de change'), findsOneWidget);
    expect(find.text('Terminer conversion'), findsOneWidget);
    expect(find.text('Conversion de monnaie effectuée avec succès !'), findsOneWidget);
    expect(find.text('Aucun mouvement n\'a été trouvé!'), findsOneWidget);
    expect(find.text('Reçu de mouvement'), findsOneWidget);
    await tester.pumpAndSettle();
  });
}