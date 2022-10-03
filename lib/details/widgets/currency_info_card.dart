import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class CurrencyInfoCard extends StatelessWidget {
  String infoText;
  String currencyInfo;
  TextStyle style;

  CurrencyInfoCard({
    Key? key,
    required this.infoText,
    required this.currencyInfo,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 1, color: hiddenBoxColor,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                infoText,
                style: const TextStyle(
                  fontSize: 19,
                  color: lightColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(currencyInfo, style: style
                ),
            ],
          ),
        ),
      ],
    );
  }
}
