import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/models/crypto_model.dart';
import '../../review/view/review_page.dart';
import '../../shared/args/arguments.dart';
import '../../shared/styles/colors.dart';
import '../providers/convert_providers.dart';

class BottomSheetConverter extends ConsumerWidget {
  final CryptoModel firstCryptoCoin;
  const BottomSheetConverter({
    Key? key,
    required this.firstCryptoCoin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondSelectedCoin = ref.watch(secondSelectedCoinProvider.state);
    final estimatedTotalOfCoin = ref.watch(totalCalcProvider.state);
    final isEnabled = ref.watch(isEnabledButtonProvider.state);

    return Container(
      height: 81,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total Estimado',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: lightColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${estimatedTotalOfCoin.state.toStringAsFixed(6).replaceAll('.', ',')} ${secondSelectedCoin.state.symbol.toUpperCase()}',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: darkColor,
                ),
              ),
            ],
          ),
          FloatingActionButton(
            onPressed: isEnabled.state
                ? () {
                    Navigator.of(context).pushNamed(
                      ReviewPage.route,
                      arguments: Arguments(
                        cryptoModel: firstCryptoCoin,
                      ),
                    );
                  }
                : null,
            backgroundColor: isEnabled.state ? magenta : hiddenBoxColor,
            child: const Icon(Icons.arrow_forward_outlined),
          )
        ],
      ),
    );
  }
}
