import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/styles/colors.dart';

import '../../portfolio/models/crypto_model.dart';
import '../../portfolio/providers/dio_providers.dart';

class DropdownbuttonConverter extends HookConsumerWidget {
  final CryptoModel cryptoModel;
  final void Function(CryptoModel?) onChangeDrop;
  const DropdownbuttonConverter({
    super.key,
    required this.cryptoModel,
    required this.onChangeDrop,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoListData = ref.watch(cryptoListProvider);

    List<CryptoModel> listCryptos = [];

    for (CryptoModel crypto in cryptoListData.value!.cryptoModelList) {
      listCryptos.add(crypto);
    }

    return SizedBox(
      height: 32,
      width: 100,
      child: DropdownButtonFormField(
          items: listCryptos
              .map<DropdownMenuItem<CryptoModel>>((CryptoModel crypto) {
            return DropdownMenuItem(
              value: crypto,
              child: Row(
                children: [
                  Image.network(
                    crypto.image,
                    scale: 13,
                  ),
                  const SizedBox(width: 6),
                  Text(crypto.symbol.toUpperCase()),
                ],
              ),
            );
          }).toList(),
          value: cryptoModel,
          style: const TextStyle(
            fontSize: 14,
            color: darkColor,
            fontWeight: FontWeight.w500,
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 18,
            color: lightColor,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: darkColor),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: magenta,
                  width: 1.4,
                )),
          ),
          onChanged: onChangeDrop),
    );
  }
}
