import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/styles/colors.dart';
import '../models/movimentation_model.dart';
import 'column_coin_detail.dart';
import 'row_bottom_info_detail_movimentation.dart';

class BottomSheetDetailMovimentation extends StatelessWidget {
  final MovimentationModel movimentationInfo;
  const BottomSheetDetailMovimentation(
      {Key? key, required this.movimentationInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
           Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              AppLocalizations.of(context)!.receipt,
              style: const TextStyle(
                fontSize: 22,
                color: darkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ColumnCoinDetail(
            title: AppLocalizations.of(context)!.source,
            image: movimentationInfo.firstCryptoModel.image,
            coinAbbrev: movimentationInfo.firstCryptoModel.symbol.toUpperCase(),
            coinValue: movimentationInfo.valueFirstCrypto.toStringAsFixed(4),
          ),
          ColumnCoinDetail(
            title: AppLocalizations.of(context)!.destination,
            image: movimentationInfo.secondCryptoModel.image,
            coinAbbrev:
                movimentationInfo.secondCryptoModel.symbol.toUpperCase(),
            coinValue: movimentationInfo.valueSecondCrypto.toStringAsFixed(4),
          ),
          const Divider(
            thickness: 1.3,
            height: 22,
          ),
          RowBottomInfoDetailMovimentation(
            title: AppLocalizations.of(context)!.movementDate,
            info: DateFormat("dd/MM/yyyy")
                .format(movimentationInfo.conversionDate),
          ),
          const Divider(
            thickness: 1.3,
            height: 22,
          ),
          RowBottomInfoDetailMovimentation(
            title: AppLocalizations.of(context)!.valueInReais,
            info: NumberFormat.simpleCurrency(
              locale: 'pt_BR',
              decimalDigits: 2,
            ).format(
              DecimalIntl(movimentationInfo.conversionInReais),
            ),
          ),
        ],
      ),
    );
  }
}
