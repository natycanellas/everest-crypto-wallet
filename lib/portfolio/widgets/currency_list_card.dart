import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/args/arguments.dart';
import '../../shared/styles/colors.dart';
import '../useCase/models/crypto_model.dart';

class CurrencyListCard extends StatefulHookConsumerWidget {
  CryptoModel coin;
  final Decimal userAmountCrypto;
  bool isInfoVisible;

  CurrencyListCard({
    Key? key,
    required this.coin,
    required this.userAmountCrypto,
    required this.isInfoVisible,
  }) : super(key: key);

  @override
  ConsumerState<CurrencyListCard> createState() => _CurrencyListCardState();
}

class _CurrencyListCardState extends ConsumerState<CurrencyListCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed('/details-page',
            arguments: Arguments(cryptoModel: widget.coin, userAmountCrypto: widget.userAmountCrypto));
      },
      horizontalTitleGap: 8,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.network(widget.coin.image),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.coin.symbol,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
              color: darkColor,
            ),
          ),
          Visibility(
            visible: widget.isInfoVisible,
            replacement: Container(
              height: 24,
              width: 100,
              decoration: BoxDecoration(
                  color: hiddenBoxColor,
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
                  .format(
                DecimalIntl(
                  Decimal.parse(
                    widget.coin.userValueMoney(widget.userAmountCrypto).toString(),
                  ),
                ),
              ),
              style: const TextStyle(fontSize: 19, color: darkColor),
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.coin.name,
            style: const TextStyle(
              fontSize: 15,
              color: lightColor,
            ),
          ),
          Visibility(
            visible: widget.isInfoVisible,
            replacement: Container(
              height: 20,
              width: 55,
              decoration: BoxDecoration(
                color: hiddenBoxColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              '${widget.userAmountCrypto} ${widget.coin.symbol.toUpperCase()}',
              style: const TextStyle(
                fontSize: 15,
                color: lightColor,
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
          color: lightColor,
        ),
      ),
    );
  }
}
