import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/models/crypto_model.dart';
import '../../shared/args/arguments.dart';
import '../widgets/app_bar_details.dart';
import '../widgets/body_details.dart';

class DetailsPage extends HookConsumerWidget {
  static const route = '/details-page';

  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    CryptoModel crypto = args.cryptoModel;
    Decimal userAmount = args.userAmountCrypto;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarDetails(),
      body: BodyDetails(
        coin: crypto,
        amount: userAmount,
      ),
    );
  }
}
