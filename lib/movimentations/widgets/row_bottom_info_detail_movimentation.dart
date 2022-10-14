
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class RowBottomInfoDetailMovimentation extends StatelessWidget {
  final String title;
  final String info;
  const RowBottomInfoDetailMovimentation({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

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