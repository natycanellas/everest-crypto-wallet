import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'portfolio/view/crypto_page.dart';
import 'shared/routes/routes.dart';


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
