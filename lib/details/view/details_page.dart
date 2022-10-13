import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/models/crypto_model.dart';
import '../widgets/app_bar_details.dart';
import '../widgets/body_details.dart';

class DetailsPage extends HookConsumerWidget {
  static const route = '/details-page';

  final CryptoModel crypto;
  final Decimal userAmount;

  const DetailsPage({
    Key? key,
    required this.crypto,
    required this.userAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
