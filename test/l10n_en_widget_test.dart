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
      'WHEN sets locale to USA THEN ensure it returns the correct language',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      SetupWidgetTester(
        locale: const Locale('en', 'US'),
        child: L10nTester(),
      ),
    );
    expect(find.text('Crypto'), findsOneWidget);
    expect(find.text('Total value of coins'), findsOneWidget);
    expect(find.text('Portfolio'), findsOneWidget);
    expect(find.text('Movimentations'), findsOneWidget);
    expect(find.text('Details'), findsOneWidget);
    expect(find.text('Actual price'), findsOneWidget);
    expect(find.text('24H Variation'), findsOneWidget);
    expect(find.text('Quantity'), findsOneWidget);
    expect(find.text('Value'), findsOneWidget);
    expect(find.text('Convert currency'), findsOneWidget);
    expect(find.text('Conversion'), findsOneWidget);
    expect(find.text('Available balance'), findsOneWidget);
    expect(find.text('How much would you like to convert?'), findsOneWidget);
    expect(find.text('Insufficient funds'), findsOneWidget);
    expect(find.text('Estimated Total'), findsOneWidget);
    expect(find.text('Review'), findsOneWidget);
    expect(find.text('Review the data of your conversion'), findsOneWidget);
    expect(find.text('Convert'), findsOneWidget);
    expect(find.text('Receive'), findsOneWidget);
    expect(find.text('Exchange rate'), findsOneWidget);
    expect(find.text('Complete conversion'), findsOneWidget);
    expect(find.text('Currency conversion done successfully!'), findsOneWidget);
    expect(find.text('No movimentations found!'), findsOneWidget);
    expect(find.text('Movimentation Receipt'), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
  