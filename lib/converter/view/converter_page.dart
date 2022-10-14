import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../portfolio/models/crypto_model.dart';
import '../widgets/app_bar_converter.dart';
import '../widgets/bottom_sheet_converter.dart';
import '../widgets/converter_body.dart';

class ConverterPage extends StatelessWidget {
  static const String route = '/converter';

  final CryptoModel cryptoModelCoin;
  final Decimal userAmount;

  const ConverterPage({
    Key? key,
    required this.cryptoModelCoin,
    required this.userAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarConverter(),
      body: ConverterBody(
        cryptoCoin: cryptoModelCoin,
        amountCrypto: userAmount,
      ),
      bottomSheet: BottomSheetConverter(firstCryptoCoin: cryptoModelCoin),
    );
  }
}
