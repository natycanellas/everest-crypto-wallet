import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
import 'row_coin_info_detail.dart';

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
        const Divider(
          thickness: 1.3,
          height: 22,
        ),
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
        RowCoinInfoDetail(title: 'Moeda', info: coinAbbrev),
        const SizedBox(height: 8),
        RowCoinInfoDetail(title: 'Quantidade', info: coinValue),
      ],
    );
  }
}


