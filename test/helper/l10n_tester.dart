import 'package:flutter/cupertino.dart';
import 'package:warren_first_task/l10n/app_localizations.dart';

class L10nTester extends StatelessWidget {
  const L10nTester({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.cryptoTitle),
        Text(AppLocalizations.of(context)!.cryptoSubtitle),
        Text(AppLocalizations.of(context)!.portfolio),
        Text(AppLocalizations.of(context)!.movimentations),
        Text(AppLocalizations.of(context)!.details),
        Text(AppLocalizations.of(context)!.actualPrice),
        Text(AppLocalizations.of(context)!.dayVariation),
        Text(AppLocalizations.of(context)!.quantity),
        Text(AppLocalizations.of(context)!.value),
        Text(AppLocalizations.of(context)!.convertCurrency),
        Text(AppLocalizations.of(context)!.convert),
        Text(AppLocalizations.of(context)!.available),
        Text(AppLocalizations.of(context)!.convertQuestion),
        Text(AppLocalizations.of(context)!.insufficientFunds),
        Text(AppLocalizations.of(context)!.estimatedTotal),
        Text(AppLocalizations.of(context)!.review),
        Text(AppLocalizations.of(context)!.reviewQuote),
        Text(AppLocalizations.of(context)!.toConvert),
        Text(AppLocalizations.of(context)!.toReceive),
        Text(AppLocalizations.of(context)!.exchangeRate),
        Text(AppLocalizations.of(context)!.completeConversion),
        Text(AppLocalizations.of(context)!.conversionDone),
        Text(AppLocalizations.of(context)!.conversionDoneQuote),
        Text(AppLocalizations.of(context)!.noMovimentations),
        Text(AppLocalizations.of(context)!.receipt),
      ],
    );
  }
}
