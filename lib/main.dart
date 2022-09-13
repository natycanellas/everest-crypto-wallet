import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'screen/wallet/crypto_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: 'Crypto Listing',
        debugShowCheckedModeBanner: false,
        home: CryptoPage(),
      ),
    ),
  );
}
