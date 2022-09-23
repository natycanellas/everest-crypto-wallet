import 'package:flutter/material.dart';

import '../styles/colors.dart';

class BottomNavigationCrypto extends StatelessWidget {
  final int selectedIndex;

  const BottomNavigationCrypto({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/crypto-page');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/movimentations-page');
          break;
      }
    }

    return BottomNavigationBar(
      selectedItemColor: darkColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Image(image: AssetImage('assets/images/WarrenOn.png')),
          icon: Image(image: AssetImage('assets/images/WarrenOff.png')),
          label: 'Portfólio',
        ),
        BottomNavigationBarItem(
          activeIcon: Image(image: AssetImage('assets/images/CryptoOn.png')),
          icon: Image(image: AssetImage('assets/images/CryptoOff.png')),
          label: 'Movimentações',
        ),
      ],
      onTap: onItemTapped,
      currentIndex: selectedIndex,
    );
  }
}
