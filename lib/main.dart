import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/shared/routes.dart';

import 'portfolio/view/crypto_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Crypto Listing',
        debugShowCheckedModeBanner: false,
        initialRoute: CryptoPage.route,
        routes: appRoutes,
      ),
    ),
  );
}
