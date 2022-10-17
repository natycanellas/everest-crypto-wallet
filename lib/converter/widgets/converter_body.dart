import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';
import '../../portfolio/models/crypto_model.dart';
import '../../shared/styles/colors.dart';
import '../providers/convert_providers.dart';
import 'available_balance_converter.dart';
import 'drop_down_buttons_row.dart';
import 'text_form_field_converter_widget.dart';

class ConverterBody extends HookConsumerWidget {
  final CryptoModel cryptoCoin;
  final Decimal amountCrypto;
  const ConverterBody({
    Key? key,
    required this.cryptoCoin,
    required this.amountCrypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondSelectedCrypto = ref.watch(secondSelectedCoinProvider.state);
    final valueController =
        ref.watch(valueCryptoTextFieldControllerProvider.state);
    final convertReais = ref.watch(converterReaisProvider.state);
    final total = ref.watch(totalCalcProvider.state);

    final balanceAvailable = amountCrypto;

    Decimal getValueConverter() {
      if (valueController.state.text != '') {
        convertReais.state =
            Decimal.parse(valueController.state.text.replaceAll(',', '.')) *
                Decimal.parse(cryptoCoin.actualPrice.toString());
      } else {
        convertReais.state = Decimal.parse('0');
      }
      return convertReais.state;
    }

    double getTotalNewCoin() {
      total.state = convertReais.state.toDouble() /
          secondSelectedCrypto.state.actualPrice.toDouble();
      return total.state;
    }

    bool checkCryptoValuePossible() {
      if (valueController.state.text != '') {
        if (double.parse(valueController.state.text.replaceAll(',', '.')) >
                (balanceAvailable.toDouble()) ||
            double.parse(valueController.state.text.replaceAll(',', '.')) ==
                0) {
          return false;
        } else {
          return true;
        }
      }
      return false;
    }

    floatButtonIsEnabled() {
      if (valueController.state.text != '') {
        if (checkCryptoValuePossible()) {
          ref.read(isEnabledButtonProvider.state).state = true;
        } else {
          ref.read(isEnabledButtonProvider.state).state = false;
        }
      } else {
        ref.read(isEnabledButtonProvider.state).state = false;
      }
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvailableBalanceConverter(
            userAmountCoin: amountCrypto,
            crypto: cryptoCoin,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Text(
              AppLocalizations.of(context)!.convertQuestion,
              style: const TextStyle(
                  fontSize: 26, fontWeight: FontWeight.w700, color: darkColor),
            ),
          ),
          DropDownButtonsRow(
            cryptoCoin: cryptoCoin,
            secondSelectedCrypto: secondSelectedCrypto,
            onChanged: (CryptoModel? newSelectedCoin) {
              secondSelectedCrypto.state = newSelectedCoin!;
              getValueConverter();
              getTotalNewCoin();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.5),
            child: TextFormFieldConverterWidget(
              onChange: (value) {
                getValueConverter();
                getTotalNewCoin();
                floatButtonIsEnabled();
              },
              availableAmount: balanceAvailable.toDouble(),
              crypto: cryptoCoin,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 23.5,
              vertical: 8,
            ),
            child: Text(
              NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                  .format(
                DecimalIntl(convertReais.state),
              ),
              style: const TextStyle(
                fontSize: 15,
                color: lightColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
