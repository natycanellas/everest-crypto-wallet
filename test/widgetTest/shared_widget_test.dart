import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_first_task/portfolio/view/crypto_page.dart';
import 'package:warren_first_task/shared/widgets/bottom_navigation_crypto.dart';
import 'package:warren_first_task/shared/widgets/magenta_bottom_button.dart';

import '../helper/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets(
      'WHEN loads Bottom Navigation Crypto THEN ensure it returns widget',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        const BottomNavigationCrypto(
          selectedIndex: 1,
        ));
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });
  testWidgets(
      'WHEN taps Bottom Navigation Crypto THEN ensure it works',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        const CryptoPage());
    expect(find.byType(CryptoPage), findsOneWidget);
    await tester.tap(find.byType(BottomNavigationCrypto));
    await tester.pump(const Duration(seconds: 2));
  });
  testWidgets(
      'WHEN loads Magenta Bottom Button THEN ensure it returns the correct widgets',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        MagentaBottomButton(
          onPressed: () {},
          title: 'Concluir',
        ));
    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    await tester.pump(const Duration(seconds: 3));
  });
}
