import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:warren_first_task/shared/providers/provider_shared.dart';

import '../../shared/styles/colors.dart';
import 'button_days.dart';
import 'convert_button_details.dart';
import 'currency_info_card.dart';
import 'line_chart_widget.dart';

class BodyDetails extends HookConsumerWidget {
  const BodyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoModel = ref.watch(cryptoCoinProvider.notifier).state;

    TextStyle infoStyle = const TextStyle(
        fontSize: 18, color: darkColor, fontWeight: FontWeight.w400);

    TextStyle variationStyle = TextStyle(
        fontSize: 18,
        color: cryptoModel.variation! < 0.0 ? Colors.red : Colors.green,
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
                  cryptoModel.name,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: darkColor,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(cryptoModel.imagePath, scale: 1.2),
                ),
              ],
            ),
            Text(
              cryptoModel.abbreviation,
              style: const TextStyle(
                fontSize: 17,
                color: lightColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                  .format(DecimalIntl(cryptoModel.actualPrice)),
              style: const TextStyle(
                fontSize: 32,
                color: darkColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const LineChartWidget(),
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
              infoText: 'Preço atual',
              currencyInfo:
                  NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                      .format(DecimalIntl(cryptoModel.actualPrice)),
              style: infoStyle,
            ),
            CurrencyInfoCard(
              infoText: 'Variação 24H',
              currencyInfo: cryptoModel.variation! < 0
                  ? '-${cryptoModel.variation!.toStringAsFixed(2)}%'
                  : '${cryptoModel.variation!.toStringAsFixed(2)}%',
              style: variationStyle,
            ),
            CurrencyInfoCard(
              infoText: 'Quantidade',
              currencyInfo:
                  '${cryptoModel.coinAmount} ${cryptoModel.abbreviation}',
              style: infoStyle,
            ),
            CurrencyInfoCard(
              infoText: 'Valor',
              currencyInfo:
                  NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                      .format(DecimalIntl(cryptoModel.value)),
              style: infoStyle,
            ),
            const SizedBox(height: 16),
            const ConvertButtonDetails(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}