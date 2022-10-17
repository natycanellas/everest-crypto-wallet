import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../converter/view/converter_page.dart';
import '../../l10n/app_localizations.dart';
import '../../portfolio/models/crypto_model.dart';
import '../../shared/args/arguments.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/magenta_bottom_button.dart';
import '../providers/chart_providers.dart';
import 'button_days.dart';
import 'currency_info_card.dart';
import 'line_chart_widget.dart';

class BodyDetails extends HookConsumerWidget {
  CryptoModel coin;
  Decimal amount;
  BodyDetails({
    super.key,
    required this.coin,
    required this.amount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle infoStyle = const TextStyle(
        fontSize: 18, color: darkColor, fontWeight: FontWeight.w400);

    TextStyle variationStyle = TextStyle(
        fontSize: 18,
        color: coin.variation < 0.0 ? Colors.red : Colors.green,
        fontWeight: FontWeight.w400);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  coin.name,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: darkColor,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    coin.image,
                    scale: 4.5,
                  ),
                ),
              ],
            ),
            Text(
              coin.symbol.toUpperCase(),
              style: const TextStyle(
                fontSize: 17,
                color: lightColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                  .format((coin.actualPrice)),
              style: const TextStyle(
                fontSize: 32,
                color: darkColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            FutureBuilder(
              future: ref.watch(getChartInfoProvider(coin.id).future),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return LineChartWidget(
                    chartInfoList: List<FlSpot>.from(
                      snapshot.data!.prices.map(
                        (e) => FlSpot(
                          e[0].toDouble(),
                          e[1].toDouble(),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ButtonDays(daySpan: '5D', numberDays: 5),
                ButtonDays(daySpan: '15D', numberDays: 15),
                ButtonDays(daySpan: '30D', numberDays: 30),
                ButtonDays(daySpan: '45D', numberDays: 45),
                ButtonDays(daySpan: '90D', numberDays: 90),
              ],
            ),
            CurrencyInfoCard(
              infoText: AppLocalizations.of(context)!.actualPrice,
              currencyInfo:
                  NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                      .format((coin.actualPrice)),
              style: infoStyle,
            ),
            CurrencyInfoCard(
              infoText: AppLocalizations.of(context)!.dayVariation,
              currencyInfo: coin.variation < 0
                  ? '-${coin.variation.toStringAsFixed(2)}%'
                  : '${coin.variation.toStringAsFixed(2)}%',
              style: variationStyle,
            ),
            CurrencyInfoCard(
              infoText: AppLocalizations.of(context)!.quantity,
              currencyInfo: '$amount ${coin.symbol.toUpperCase()}',
              style: infoStyle,
            ),
            CurrencyInfoCard(
              infoText: AppLocalizations.of(context)!.value,
              currencyInfo:
                  NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                      .format((coin.actualPrice * amount.toDouble())),
              style: infoStyle,
            ),
            const SizedBox(height: 16),
            MagentaBottomButton(
              title: AppLocalizations.of(context)!.convertCurrency,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ConverterPage.route,
                  arguments: Arguments(
                    cryptoModel: coin,
                    userAmountCrypto: amount,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
