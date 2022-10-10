import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/portfolio/models/crypto_model.dart';
import 'package:warren_first_task/shared/widgets/magenta_bottom_button.dart';
import 'package:warren_first_task/success/view/success_page.dart';

import '../../converter/providers/convert_providers.dart';
import 'sheet_row_conversion_info.dart';

class BottomSheetReview extends HookConsumerWidget {
  final CryptoModel firstCrypto;
  const BottomSheetReview({
    Key? key,
    required this.firstCrypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondCrypto = ref.watch(secondSelectedCoinProvider.state);
    final estimatedTotal = ref.watch(totalCalcProvider.state);
    final valueController =
        ref.watch(valueCryptoTextFieldControllerProvider.state);
    String abbrevFirstCrypto = firstCrypto.symbol.toUpperCase();
    String abbrevSecCrypto = secondCrypto.state.symbol.toUpperCase();

    double getExchangeRate() {
      double total;
      total = firstCrypto.actualPrice / secondCrypto.state.actualPrice;
      return total;
    }

    return Container(
      padding: const EdgeInsets.only(left: 16),
      height: 300,
      child: Column(
        children: [
          const Divider(
            thickness: 1,
          ),
          SheetRowConversionInfo(
            textOne: 'Converter',
            textTwo: '${valueController.state.text.replaceAll('.', ',')} $abbrevFirstCrypto',
          ),
          const Divider(
            thickness: 1,
          ),
          SheetRowConversionInfo(
            textOne: 'Receber',
            textTwo: '${estimatedTotal.state.toStringAsFixed(6).replaceAll('.', ',')} $abbrevSecCrypto',
          ),
          const Divider(
            thickness: 1,
          ),
          SheetRowConversionInfo(
            textOne: 'Câmbio',
            textTwo:
                '1 $abbrevFirstCrypto = ${getExchangeRate().toStringAsFixed(2).replaceAll('.', ',')} $abbrevSecCrypto',
          ),
          Container(
              padding: const EdgeInsets.only(right: 16, top: 10),
              height: 66,
              width: MediaQuery.of(context).size.width,
              child: MagentaBottomButton(
                title: 'Concluir Conversão',
                onPressed: () {
                  Navigator.of(context).pushNamed(SuccessPage.route);
                },
              )),
        ],
      ),
    );
  }
}
