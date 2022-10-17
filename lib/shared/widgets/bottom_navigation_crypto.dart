import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: const Image(image: AssetImage('assets/images/WarrenOn.png')),
          icon: const Image(image: AssetImage('assets/images/WarrenOff.png')),
          label: AppLocalizations.of(context)!.portfolio,
        ),
        BottomNavigationBarItem(
          activeIcon: const Image(image: AssetImage('assets/images/CryptoOn.png')),
          icon: const Image(image: AssetImage('assets/images/CryptoOff.png')),
          label: AppLocalizations.of(context)!.movimentations,
        ),
      ],
      onTap: onItemTapped,
      currentIndex: selectedIndex,
    );
  }
}
