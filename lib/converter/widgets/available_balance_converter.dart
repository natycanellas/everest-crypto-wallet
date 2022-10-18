import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../portfolio/models/crypto_model.dart';
import '../../shared/styles/colors.dart';

class AvailableBalanceConverter extends HookConsumerWidget {
  final CryptoModel crypto;
  final Decimal userAmountCoin;
  const AvailableBalanceConverter({
    Key? key,
    required this.crypto,
    required this.userAmountCoin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: const Color.fromARGB(156, 233, 235, 242),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.available,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: lightColor,
            ),
          ),
          Text(
            '${userAmountCoin.toStringAsFixed(6).replaceAll('.', ',')} ${crypto.symbol.toUpperCase()}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: darkColor,
            ),
          ),
        ],
      ),
    );
  }
}
