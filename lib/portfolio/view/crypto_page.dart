import 'package:flutter/material.dart';

import '../../shared/widgets/bottom_navigation_crypto.dart';
import '../widgets/body_crypto.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({Key? key}) : super(key: key);

  static const route = '/crypto-page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyCrypto(),
      bottomNavigationBar: BottomNavigationCrypto(selectedIndex: 0),
    );
  }
}
