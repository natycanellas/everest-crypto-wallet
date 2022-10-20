import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_first_task/success/view/success_page.dart';

import 'helper/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets('WHEN loading the Success page THEN ensure it returns the body',
      (WidgetTester tester) async {
    await loadPage(tester, const SuccessPage());
    expect(find.byType(AppBar), findsWidgets);
    expect(find.byIcon(Icons.close_rounded), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);
    await tester.pump(const Duration(seconds: 3));
  });
}