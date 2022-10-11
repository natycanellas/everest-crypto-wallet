import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
import 'divider_bottom_sheet_detail.dart';

class ColumnCoinDetail extends StatelessWidget {
  final String title;
  final String image;
  final String coinAbbrev;
  final String coinValue;

  const ColumnCoinDetail({
    Key? key,
    required this.title,
    required this.image,
    required this.coinAbbrev,
    required this.coinValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DividerBottomSheetDetail(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: darkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              image,
              scale: 12,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Moeda',
              style: TextStyle(
                fontSize: 19,
                color: darkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              coinAbbrev,
              style: const TextStyle(
                fontSize: 19,
                color: lightColor,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quantidade',
              style: TextStyle(
                fontSize: 19,
                color: darkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              coinValue,
              style: const TextStyle(
                fontSize: 19,
                color: lightColor,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ],
    );
  }
}
