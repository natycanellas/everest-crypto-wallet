import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';
import '../../shared/bottom_navigation_crypto.dart';
import '../widgets/currency_card.dart';
import '../widgets/title_row.dart';
import '../widgets/total_value_column.dart';

class CryptoPage extends StatefulHookConsumerWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends ConsumerState<CryptoPage> {
  double btcQuantity = 0.65;
  double ethQuantity = 0.94;
  double ltcQuantity = 0.82;

  static var btcValueOwned = Decimal.parse('6557.00');
  static var ethValueOwned = Decimal.parse('7996.00');
  static var ltcValueOwned = Decimal.parse('245.00');

  var totalAmountOwned = btcValueOwned + ethValueOwned + ltcValueOwned;

  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibleProvider.state);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleRow(),
              const SizedBox(height: 8),
              TotalValueColumn(
                  isVisibleState: isVisibleState,
                  totalAmountOwned: totalAmountOwned),
              CurrencyCard(
                iconPath: 'assets/images/BTC.png',
                abrevCurrencyName: 'BTC',
                currencyName: 'Bitcoin',
                value: btcValueOwned,
                currencyValue: btcQuantity,
                isInfoVisible: isVisibleState.state,
              ),
              CurrencyCard(
                iconPath: 'assets/images/ETH.png',
                abrevCurrencyName: 'ETH',
                currencyName: 'Ethereum',
                value: ethValueOwned,
                currencyValue: ethQuantity,
                isInfoVisible: isVisibleState.state,
              ),
              CurrencyCard(
                iconPath: 'assets/images/LTC.png',
                abrevCurrencyName: 'LTC',
                currencyName: 'Litecoin',
                value: ltcValueOwned,
                currencyValue: ltcQuantity,
                isInfoVisible: isVisibleState.state,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationCrypto(),
    );
  }
}