
import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class BottomNavigationCrypto extends StatefulWidget {
  const BottomNavigationCrypto({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationCrypto> createState() => _BottomNavigationCryptoState();
}

class _BottomNavigationCryptoState extends State<BottomNavigationCrypto> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
    return BottomNavigationBar(
      selectedItemColor: darkText,
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
      currentIndex: _selectedIndex,
      onTap: onItemTapped,
    );
  }
}