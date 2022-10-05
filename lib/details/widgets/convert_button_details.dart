import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../portfolio/models/crypto_model.dart';
import '../../shared/args/arguments.dart';

import '../../shared/styles/colors.dart';

class ConvertButtonDetails extends StatelessWidget {
  CryptoModel crypto;
  Decimal userAmount;
  ConvertButtonDetails({
    Key? key,
    required this.crypto,
    required this.userAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/converter',
              arguments: Arguments(
                cryptoModel: crypto,
                userAmountCrypto: userAmount,
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: magenta),
          child: const Text(
            'Converter moeda',
            style: TextStyle(fontSize: 17, color: Colors.white),
          )),
    );
  }
}
