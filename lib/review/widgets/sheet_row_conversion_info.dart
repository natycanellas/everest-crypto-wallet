
import 'package:flutter/material.dart';
import 'package:warren_first_task/shared/styles/colors.dart';

class SheetRowConversionInfo extends StatelessWidget {
  final String textOne;
  final String textTwo;
  const SheetRowConversionInfo({
    Key? key,
    required this.textOne,
    required this.textTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 13, bottom: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textOne,
            style: const TextStyle(
              fontSize: 19,
              color: lightColor,
            ),
          ),
          Text(
            textTwo,
            style: const TextStyle(
              fontSize: 19,
              color: darkColor,
            ),
          )
        ],
      ),
    );
  }
}
