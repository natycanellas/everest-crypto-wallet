import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/colors.dart';
import '../models/crypto_model.dart';

class CurrencyListCard extends StatelessWidget {
  CryptoModel coin;
  bool isInfoVisible;

  CurrencyListCard({
    Key? key,
    required this.coin,
    required this.isInfoVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 8,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(coin.imagePath, scale: 1.2),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            coin.abbreviation,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
              color: darkText,
            ),
          ),
          Visibility(
            visible: isInfoVisible,
            replacement: Container(
              height: 24,
              width: 100,
              decoration: BoxDecoration(
                  color: hiddenInfo, borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
                  .format(DecimalIntl(coin.value)),
              style: const TextStyle(fontSize: 19, color: darkText),
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            coin.name,
            style: const TextStyle(
              fontSize: 15,
              color: lightText,
            ),
          ),
          Visibility(
            visible: isInfoVisible,
            replacement: Container(
              height: 20,
              width: 55,
              decoration: BoxDecoration(
                  color: hiddenInfo, borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              '${coin.coinAmount} ${coin.abbreviation}',
              style: const TextStyle(
                fontSize: 15,
                color: lightText,
              ),
            ),
          ),
        ],
      ),
      trailing: const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: lightText,
        ),
      ),
    );
  }
}
