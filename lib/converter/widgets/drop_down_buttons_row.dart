import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/models/crypto_model.dart';
import '../../shared/styles/colors.dart';
import 'dropdownbutton_converter.dart';

class DropDownButtonsRow extends StatelessWidget {
  const DropDownButtonsRow({
    Key? key,
    required this.cryptoCoin,
    required this.secondSelectedCrypto,
    required this.onChanged
  }) : super(key: key);

  final CryptoModel cryptoCoin;
  final StateController<CryptoModel> secondSelectedCrypto;
  final void Function(CryptoModel?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            height: 32,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: lightColor),
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {},
            child: SizedBox(
              height: 20,
              width: 74,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    cryptoCoin.image,
                    scale: 13,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    cryptoCoin.symbol.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: darkColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.compare_arrows_outlined,
              size: 30,
              color: magenta,
            ),
          ),
          DropdownbuttonConverter(
            onChangeDrop: onChanged,
            cryptoModel: secondSelectedCrypto.state,
          ),
        ],
      ),
    );
  }
}
