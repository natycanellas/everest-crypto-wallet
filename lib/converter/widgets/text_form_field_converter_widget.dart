import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/models/crypto_model.dart';
import '../../shared/styles/colors.dart';
import '../providers/convert_providers.dart';

class TextFormFieldConverterWidget extends HookConsumerWidget {
  final CryptoModel crypto;
  final void Function(String) onChange;
  final double availableAmount;

  const TextFormFieldConverterWidget({
    Key? key,
    required this.crypto,
    required this.onChange,
    required this.availableAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueControllerCoin =
        ref.watch(valueCryptoTextFieldControllerProvider.state);
    bool validationForController() {
      if (valueControllerCoin.state.text != '') {
        if (double.parse(valueControllerCoin.state.text.replaceAll(',', '.')) >
            availableAmount) {
          return false;
        } else {
          return true;
        }
      } else {
        return true;
      }
    }

    return TextFormField(
      controller: valueControllerCoin.state,
      keyboardType: TextInputType.number,
      style: const TextStyle(
        fontSize: 31,
        color: darkColor,
      ),
      onChanged: onChange,
      decoration: InputDecoration(
        errorText: validationForController() ? null : 'Saldo Insuficiente',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 5, right: 8),
          child: Text(
            crypto.symbol.toUpperCase(),
            style: const TextStyle(fontSize: 31, color: darkColor),
          ),
        ),
        hintText: '0,00',
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: hiddenBoxColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: darkColor),
        ),
      ),
    );
  }
}
