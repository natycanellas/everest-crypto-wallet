import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/movimentation_model.dart';
import '../../shared/styles/colors.dart';

import 'bottom_sheet_detail_movimentation.dart';

class ListTileMovimentation extends StatelessWidget {
  final MovimentationModel movimentation;
  const ListTileMovimentation({
    Key? key,
    required this.movimentation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showBottomSheet(
            constraints: const BoxConstraints(
              maxHeight: 416,
            ),
            context: context,
            builder: (context) {
              return BottomSheetDetailMovimentation(
                movimentationInfo: movimentation,
              );
            });
      },
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            '${movimentation.valueFirstCrypto} ${movimentation.firstCryptoModel.symbol.toUpperCase()}',
            style: const TextStyle(
              fontSize: 19,
              color: lightColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          '${movimentation.valueSecondCrypto.toStringAsFixed(4)} ${movimentation.secondCryptoModel.symbol.toUpperCase()}',
          style: const TextStyle(
            fontSize: 19,
            color: darkColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ]),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              DateFormat("dd/MM/yyyy").format(movimentation.conversionDate),
              style: const TextStyle(
                fontSize: 15,
                color: lightColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                .format(
              DecimalIntl(movimentation.conversionInReais),
            ),
            style: const TextStyle(
              fontSize: 15,
              color: lightColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}