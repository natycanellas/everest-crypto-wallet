
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/styles/colors.dart';

class TotalValueColumn extends StatefulWidget {
  const TotalValueColumn({
    Key? key,
    required this.isVisibleState,
    required this.totalAmountOwned,
  }) : super(key: key);

  final StateController<bool> isVisibleState;
  final Decimal totalAmountOwned;

  @override
  State<TotalValueColumn> createState() => _TotalValueColumnState();
}

class _TotalValueColumnState extends State<TotalValueColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.isVisibleState.state,
            replacement: Container(
              height: 38,
              width: 195,
              decoration: BoxDecoration(
                  color: hiddenBoxColor,
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              NumberFormat.simpleCurrency(
                      locale: 'pt-BR', decimalDigits: 2)
                  .format(DecimalIntl(widget.totalAmountOwned)),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: darkColor,
              ),
            ),
          ),
          const Text(
            'Valor total de moedas',
            style: TextStyle(fontSize: 17, color: lightColor),
          ),
        ],
      ),
    );
  }
}
