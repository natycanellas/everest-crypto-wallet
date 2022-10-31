import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_first_task/converter/view/converter_page.dart';
import 'package:warren_first_task/converter/widgets/app_bar_converter.dart';
import 'package:warren_first_task/converter/widgets/bottom_sheet_converter.dart';
import 'package:warren_first_task/converter/widgets/converter_body.dart';
import 'package:warren_first_task/converter/widgets/drop_down_buttons_row.dart';
import 'package:warren_first_task/converter/widgets/text_form_field_converter_widget.dart';
import 'package:warren_first_task/portfolio/models/crypto_model.dart';

import '../helper/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets('WHEN widgets work THEN ensure it returns the converter page',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        ConverterPage(
          cryptoModelCoin: CryptoModel(
            id: 'bitcoin',
            symbol: 'BTC',
            name: 'Bitcoin',
            image: Faker().image.image(),
            variation: Faker().randomGenerator.integer(5).toDouble(),
            actualPrice: Faker().randomGenerator.integer(100000).toDouble(),
          ),
          userAmount: Decimal.one,
        ));
    expect(find.byType(AppBarConverter), findsOneWidget);
    expect(find.byType(ConverterBody), findsOneWidget);
    expect(find.byType(BottomSheetConverter), findsOneWidget);
    await tester.pump();
  });
  testWidgets(
      'WHEN ConverterBody is called THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      ConverterBody(
          cryptoCoin: CryptoModel(
            id: 'bitcoin',
            symbol: 'BTC',
            name: 'Bitcoin',
            image: Faker().image.image(),
            variation: Faker().randomGenerator.integer(5).toDouble(),
            actualPrice: Faker().randomGenerator.integer(100000).toDouble(),
          ),
          amountCrypto: Decimal.one),
    );
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(DropDownButtonsRow), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Column), findsOneWidget);
    await tester.pump();
  });
  testWidgets(
      'WHEN tapping the DropDownButton THEN ensure the functions are being called',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      ConverterBody(
          cryptoCoin: CryptoModel(
            id: 'bitcoin',
            symbol: 'BTC',
            name: 'Bitcoin',
            image: Faker().image.image(),
            variation: Faker().randomGenerator.integer(5).toDouble(),
            actualPrice: Faker().randomGenerator.integer(100000).toDouble(),
          ),
          amountCrypto: Decimal.one),
    );
    await tester.tap(find.byType(DropDownButtonsRow));
    await tester.pump();
  });
  testWidgets(
      'WHEN AppBar converter is called THEN ensure it returns correct widgets',
      (WidgetTester tester) async {
    await loadPage(tester, const AppBarConverter());
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    await tester.pump();
  });
  testWidgets(
      'WHEN BottomSheet converter is called THEN ensure it returns correct widgets',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      BottomSheetConverter(
        firstCryptoCoin: CryptoModel(
          id: 'bitcoin',
          symbol: 'BTC',
          name: 'Bitcoin',
          image: Faker().image.image(),
          variation: Faker().randomGenerator.integer(5).toDouble(),
          actualPrice: Faker().randomGenerator.integer(100000).toDouble(),
        ),
      ),
    );
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    await tester.pump();
  });
  testWidgets(
      'WHEN TextFormFileConverter is called THEN ensure it returns correct widgets',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        TextFormFieldConverterWidget(
            crypto: CryptoModel(
          id: 'bitcoin',
          symbol: 'BTC',
          name: 'Bitcoin',
          image: Faker().image.image(),
          variation: Faker().randomGenerator.integer(5).toDouble(),
          actualPrice: Faker().randomGenerator.integer(100000).toDouble(),
        ),
            onChange: (text) {},
            availableAmount: 123.87));
    expect(find.byType(TextFormField), findsOneWidget);
    await tester.tap(find.byType(TextFormField));
    await tester.pump();
  });
}
