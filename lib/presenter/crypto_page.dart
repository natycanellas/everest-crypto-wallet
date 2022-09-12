import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widget/currency_card.dart';
import '../shared/colors.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  double btcQuantity = 0.65;
  double ethQuantity = 0.94;
  double ltcQuantity = 0.82;

  static double btcValueOwned = 6557.00;
  static double ethValueOwned = 7996.00;
  static double ltcValueOwned = 245.00;

  double totalAmountOwned = btcValueOwned + ethValueOwned + ltcValueOwned;

  int _selectedIndex = 0;
  static bool isEyeOpen = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cripto',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: titleMagenta,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isEyeOpen ? FeatherIcons.eye : FeatherIcons.eyeOff,
                      size: 22,
                    ),
                    onPressed: () {
                      isEyeOpen = !isEyeOpen;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: isEyeOpen,
                    replacement: Container(
                      height: 38,
                      width: 195,
                      decoration: BoxDecoration(
                          color: hiddenInfo,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      NumberFormat.simpleCurrency(
                              locale: 'pt-BR', decimalDigits: 2)
                          .format(totalAmountOwned),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: darkText,
                      ),
                    ),
                  ),
                  const Text(
                    'Valor total de moedas',
                    style: TextStyle(fontSize: 17, color: lightText),
                  ),
                ],
              ),
            ),
            CurrencyCard(
              iconPath: 'assets/images/BTC.png',
              abrevCurrencyName: 'BTC',
              currencyName: 'Bitcoin',
              value: btcValueOwned,
              variationValue: btcQuantity,
              isInfoVisible: isEyeOpen,
            ),
            CurrencyCard(
              iconPath: 'assets/images/ETH.png',
              abrevCurrencyName: 'ETH',
              currencyName: 'Ethereum',
              value: ethValueOwned,
              variationValue: ethQuantity,
              isInfoVisible: isEyeOpen,
            ),
            CurrencyCard(
              iconPath: 'assets/images/LTC.png',
              abrevCurrencyName: 'LTC',
              currencyName: 'Litecoin',
              value: ltcValueOwned,
              variationValue: ltcQuantity,
              isInfoVisible: isEyeOpen,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: darkText,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/Warren.png')),
            label: 'Portfólio',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/Crypto.png')),
            label: 'Movimentações',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
