import 'package:flutter/material.dart';

import '../../shared/widgets/bottom_navigation_crypto.dart';
import '../widgets/movimentations_body.dart';

class MovimentationsPage extends StatelessWidget {
  static const route = '/movimentations-page';

  const MovimentationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: MovimentationsBody(),
      bottomNavigationBar: BottomNavigationCrypto(selectedIndex: 1),
    );
  }
}
