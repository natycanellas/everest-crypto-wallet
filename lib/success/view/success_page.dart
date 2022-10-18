import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:warren_first_task/l10n/app_localizations.dart';

import '../../converter/providers/convert_providers.dart';
import '../../portfolio/view/crypto_page.dart';
import '../../shared/assets/images.dart';
import '../../shared/styles/colors.dart';

class SuccessPage extends HookConsumerWidget {
  static const route = '/success-page';

  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertReais = ref.watch(converterReaisProvider.state);
    final valueController =
        ref.watch(valueCryptoTextFieldControllerProvider.state);
    final estimated = ref.watch(totalCalcProvider.state);
    final isEnabled = ref.watch(isEnabledButtonProvider.state);
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          valueController.state.clear();
          convertReais.state = Decimal.parse('0');
          estimated.state = 0.0;
          isEnabled.state = false;
          Navigator.of(context).popAndPushNamed(CryptoPage.route);
        },
        icon: const Icon(
          Icons.close_rounded,
          color: darkColor,
          size: 25,
        ),
      ),
    ),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(lottieSuccess, repeat: false, height: 100),
           Text(
            AppLocalizations.of(context)!.conversionDone,
            style: const TextStyle(
              fontSize: 34,
              color: darkColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
           Text(
            AppLocalizations.of(context)!.conversionDoneQuote,
            style: const TextStyle(
              fontSize: 17,
              color: lightColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      )),
    );
  }
}