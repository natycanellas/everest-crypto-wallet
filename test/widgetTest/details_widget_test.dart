import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_first_task/details/view/details_page.dart';
import 'package:warren_first_task/details/widgets/app_bar_details.dart';
import 'package:warren_first_task/details/widgets/body_details.dart';
import 'package:warren_first_task/details/widgets/button_days.dart';
import 'package:warren_first_task/details/widgets/line_chart_widget.dart';
import 'package:warren_first_task/portfolio/models/crypto_model.dart';

import '../helper/setup_widget_tester.dart';
void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets('WHEN loading the Details page THEN ensure it returns the body',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      DetailsPage(
        crypto: CryptoModel(
          id: 'bitcoin',
          actualPrice: Decimal.ten.toDouble(),
          image: Faker().image.image(),
          name: 'Bitcoin',
          symbol: 'BTC',
          variation: Faker().randomGenerator.integer(10).toDouble(),
        ),
        userAmount: Decimal.ten,
      ),
    );
    expect(find.byType(AppBarDetails), findsOneWidget);
    expect(find.byType(BodyDetails), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });
  testWidgets(
      'WHEN loading the body THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      BodyDetails(
        coin: CryptoModel(
          id: 'bitcoin',
          actualPrice: Decimal.ten.toDouble(),
          image: Faker().image.image(),
          name: 'Bitcoin',
          symbol: 'BTC',
          variation: Faker().randomGenerator.integer(10).toDouble(),
        ),
        amount: Decimal.ten,
      ),
    );
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(ButtonDays), findsWidgets);
    await tester.pump(const Duration(seconds: 3));
  });
  testWidgets(
      'WHEN loads App Bar Details THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(tester, const AppBarDetails());
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    await tester.pump();
  });
  testWidgets(
      'WHEN loads App Bar Details THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        LineChartWidget(
          chartInfoList: [
            FlSpot(
              1,
              Faker().randomGenerator.integer(10000).toDouble(),
            ),
            FlSpot(
              2,
              Faker().randomGenerator.integer(10000).toDouble(),
            ),
            FlSpot(
              3,
              Faker().randomGenerator.integer(10000).toDouble(),
            ),
            FlSpot(
              4,
              Faker().randomGenerator.integer(10000).toDouble(),
            ),
            FlSpot(
              5,
              Faker().randomGenerator.integer(10000).toDouble(),
            ),
          ],
        ));
    expect(find.byType(LayoutBuilder), findsWidgets);
    expect(find.byType(LineChart), findsOneWidget);
    await tester.pump();
  });
}
