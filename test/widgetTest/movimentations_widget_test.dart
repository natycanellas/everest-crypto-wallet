import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_first_task/movimentations/models/movimentation_model.dart';
import 'package:warren_first_task/movimentations/view/movimentations_page.dart';
import 'package:warren_first_task/movimentations/widgets/bottom_sheet_detail_movimentation.dart';
import 'package:warren_first_task/movimentations/widgets/list_tile_movimentation.dart';
import 'package:warren_first_task/movimentations/widgets/list_view_movimentations.dart';
import 'package:warren_first_task/movimentations/widgets/movimentations_body.dart';
import 'package:warren_first_task/portfolio/models/crypto_model.dart';

import '../helper/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );

  final movimentation = MovimentationModel(
    firstCryptoModel: CryptoModel(
      id: 'bitcoin',
      symbol: 'BTC',
      name: 'Bitcoin',
      image: Faker().image.image(),
      variation: Decimal.one.toDouble(),
      actualPrice: Faker().randomGenerator.integer(100000).toDouble(),
    ),
    secondCryptoModel: CryptoModel(
      id: 'ethereum',
      symbol: 'ETH',
      name: 'Ethereum',
      image: Faker().image.image(),
      variation: Decimal.one.toDouble(),
      actualPrice: Faker().randomGenerator.integer(1000).toDouble(),
    ),
    valueFirstCrypto: Decimal.ten,
    valueSecondCrypto: Decimal.one,
    conversionInReais: Decimal.ten,
    conversionDate: Faker().date.dateTime(),
  );
  testWidgets(
      'WHEN loads the Movimentations page THEN ensure it returns the body',
      (WidgetTester tester) async {
    await loadPage(tester, const MovimentationsPage());
    expect(find.byType(MovimentationsBody), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });
  testWidgets('WHEN loads the body THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(tester, const MovimentationsBody());
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(ListViewMovimentations), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });
  testWidgets('WHEN loads ListView THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(tester, const ListViewMovimentations());
    expect(find.byType(Visibility), findsOneWidget);
    expect(find.byType(Center), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    await tester.pump(const Duration(seconds: 3));
  });
  testWidgets('WHEN loads ListTile THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      ListTileMovimentation(
        movimentation: movimentation,
      ),
    );
    expect(find.byType(ListTile), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    await tester.pump(const Duration(seconds: 3));
  });
  testWidgets('WHEN loads ListTile THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        BottomSheetDetailMovimentation(
          movimentationInfo: movimentation,
        ),);
    expect(find.byType(ListTile), findsNothing);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    await tester.pump(const Duration(seconds: 3));
  });
}
