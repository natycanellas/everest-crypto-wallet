import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/styles/colors.dart';
import '../providers/dio_providers.dart';
import '../providers/providers.dart';

class TotalValueColumn extends StatefulHookConsumerWidget {
  const TotalValueColumn({
    Key? key,
    required this.isVisibleState,
  }) : super(key: key);

  final StateController<bool> isVisibleState;

  @override
  ConsumerState<TotalValueColumn> createState() => _TotalValueColumnState();
}

class _TotalValueColumnState extends ConsumerState<TotalValueColumn> {
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
            child: FutureBuilder(
              future: ref.watch(
                  getTotalProvider(ref.watch(userAmountProvider)).future),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    NumberFormat.simpleCurrency(
                            locale: 'pt-BR', decimalDigits: 2)
                        .format(DecimalIntl(snapshot.data!)),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: darkColor,
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ),
          Text(
             AppLocalizations.of(context)!.cryptoSubtitle,
            style: const TextStyle(fontSize: 17, color: lightColor),
          ),
        ],
      ),
    );
  }
}
