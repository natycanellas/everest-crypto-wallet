import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../shared/assets_images.dart';
import '../../shared/bottom_navigation_crypto.dart';

class MovimentationsPage extends StatelessWidget {
  static const route = '/movimentations-page';

  const MovimentationsPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(child: Lottie.asset(lottieInProgress)),
           bottomNavigationBar: const BottomNavigationCrypto(selectedIndex: 1),
       );
  }
}