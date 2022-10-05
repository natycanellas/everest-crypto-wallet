import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../portfolio/models/crypto_model.dart';
import '../../shared/args/arguments.dart';
import '../widgets/app_bar_converter.dart';
import '../widgets/bottom_sheet_converter.dart';
import '../widgets/converter_body.dart';

class ConverterPage extends StatelessWidget {
  static const String route = '/converter';
  const ConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    CryptoModel cryptoModelCoin = args.cryptoModel;
    Decimal userAmount = args.userAmountCrypto;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarConverter(),
      body: ConverterBody(
        cryptoCoin: cryptoModelCoin,
        amountCrypto: userAmount,
      ),
      bottomSheet: const BottomSheetConverter(),
    );
  }
}

