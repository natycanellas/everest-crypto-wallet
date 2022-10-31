import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_first_task/portfolio/models/crypto_model.dart';
import 'package:warren_first_task/portfolio/view/crypto_page.dart';
import 'package:warren_first_task/portfolio/widgets/body_crypto.dart';
import 'package:warren_first_task/portfolio/widgets/currency_list_card.dart';
import 'package:warren_first_task/portfolio/widgets/drop_down_button_locale.dart';
import 'package:warren_first_task/portfolio/widgets/list_view_cryptos.dart';
import 'package:warren_first_task/portfolio/widgets/title_crypto_row.dart';
import 'package:warren_first_task/portfolio/widgets/total_value_column.dart';

import '../helper/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets('WHEN loads the Portfolio page THEN ensure it returns the body',
      (WidgetTester tester) async {
    await loadPage(tester, const CryptoPage());
    expect(find.byType(BodyCrypto), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets(
      'WHEN loads CryptoBody THEN ensure it returns the correct widgets from the body',
      (WidgetTester tester) async {
    await loadPage(tester, const BodyCrypto());
    expect(find.byType(TitleCryptoRow), findsOneWidget);
    expect(find.byType(TotalValueColumn), findsOneWidget);
    expect(find.byType(ListViewCryptos), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets(
      'WHEN loads TitleCryptoRow THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(tester, const TitleCryptoRow());
    expect(find.byType(DropDownButtonLocale), findsOneWidget);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(IconButton), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));

    await tester.tap(find.byType(IconButton));
    expect(find.byIcon(Icons.visibility), findsWidgets);
    expect(find.byIcon(Icons.visibility_off), findsNothing);
  });
  testWidgets(
      'WHEN loads CurrencyListCard THEN ensure it returns the correct widget',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      CurrencyListCard(
        coin: CryptoModel(
          id: 'bitcoin',
          actualPrice: Decimal.ten.toDouble(),
          image: Faker().image.image(),
          name: 'Bitcoin',
          symbol: 'BTC',
          variation: Faker().randomGenerator.integer(10).toDouble(),
        ),
        userAmountCrypto: Decimal.ten,
        isInfoVisible: true,
      ),
    );
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.tap(find.byType(CurrencyListCard));
  });
}
