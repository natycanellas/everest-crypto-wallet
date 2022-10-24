import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_first_task/portfolio/models/crypto_model.dart';
import 'package:warren_first_task/review/view/review_page.dart';
import 'package:warren_first_task/review/widgets/bottom_sheet_review.dart';
import 'package:warren_first_task/review/widgets/review_body.dart';

import '../helper/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets('WHEN loading the Review page THEN ensure it returns the body',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      ReviewPage(
        cryptoCoin: CryptoModel(
          id: 'bitcoin',
          actualPrice: Decimal.ten.toDouble(),
          image: Faker().image.image(),
          name: 'Bitcoin',
          symbol: 'BTC',
          variation: Faker().randomGenerator.integer(10).toDouble(),
        ),
      ),
    );
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(ReviewBody), findsOneWidget);
    expect(find.byType(BottomSheetReview), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });
}
