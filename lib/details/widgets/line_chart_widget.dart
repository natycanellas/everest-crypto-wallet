import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:warren_first_task/details/providers/providers.dart';

import '../../shared/styles/colors.dart';

class LineChartWidget extends StatefulHookConsumerWidget {
  final List<FlSpot> chartInfoList;
  const LineChartWidget({
    super.key,
    required this.chartInfoList,
  });

  @override
  ConsumerState<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends ConsumerState<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    final int days = ref.watch(selectDaySpanProvider);
    List<FlSpot> spots = widget.chartInfoList.sublist(0, days);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          AspectRatio(
        aspectRatio: 1.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  barWidth: 3.5,
                  color: magenta,
                  dotData: FlDotData(show: false),
                  isCurved: false,
                  isStrokeCapRound: true,
                  spots: spots,
                ),
              ],
              minX: spots.last.x,
              maxX: spots.first.x,
              betweenBarsData: [],
              titlesData: FlTitlesData(show: false),
              extraLinesData: ExtraLinesData(),
              lineTouchData: LineTouchData(
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      FlLine(
                        color: const Color.fromRGBO(224, 43, 87, 1),
                        strokeWidth: 3,
                      ),
                      FlDotData(show: false),
                    );
                  }).toList();
                },
                touchTooltipData: LineTouchTooltipData(
                  fitInsideHorizontally: true,
                  tooltipBgColor: Colors.grey,
                  tooltipPadding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 5,
                  ),
                  tooltipRoundedRadius: 15,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((touchedSpot) {
                      return LineTooltipItem(
                        NumberFormat.simpleCurrency(
                                locale: 'pt_BR', decimalDigits: 2)
                            .format(touchedSpot.y),
                        const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      );
                    }).toList();
                  },
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(
                border: const Border(
                  bottom: BorderSide(
                    width: 2,
                    color: hiddenBoxColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
