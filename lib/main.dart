import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/portfolio/view/crypto_page.dart';

import 'shared/routes/route_generator.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: 'Crypto Listing',
        debugShowCheckedModeBanner: false,
        initialRoute: CryptoPage.route,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
}
