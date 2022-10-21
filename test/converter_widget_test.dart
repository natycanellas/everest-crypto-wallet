import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_first_task/converter/view/converter_page.dart';
import 'package:warren_first_task/converter/widgets/app_bar_converter.dart';
import 'package:warren_first_task/converter/widgets/bottom_sheet_converter.dart';
import 'package:warren_first_task/converter/widgets/converter_body.dart';
import 'package:warren_first_task/portfolio/models/crypto_model.dart';

import 'helper/setup_widget_tester.dart';

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
}
