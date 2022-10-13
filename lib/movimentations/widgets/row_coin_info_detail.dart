import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class RowCoinInfoDetail extends StatelessWidget {
  const RowCoinInfoDetail({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            color: darkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 19,
            color: lightColor,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}