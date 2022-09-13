import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/colors.dart';

class CurrencyCard extends StatefulWidget {
  String iconPath;
  String abrevCurrencyName;
  String currencyName;
  double value;
  double currencyValue;
  bool isInfoVisible;

  CurrencyCard({
    Key? key,
    required this.iconPath,
    required this.abrevCurrencyName,
    required this.currencyName,
    required this.value,
    required this.currencyValue,
    required this.isInfoVisible,
  }) : super(key: key);

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 2),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(widget.iconPath, scale: 1.2)),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.abrevCurrencyName,
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(47, 47, 51, 1)),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.currencyName,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(117, 118, 128, 1)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: widget.isInfoVisible,
                        replacement: Container(
                          height: 24,
                          width: 100,
                          decoration: BoxDecoration(
                              color: hiddenInfo,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          NumberFormat.simpleCurrency(
                                  locale: 'pt-BR', decimalDigits: 2)
                              .format(widget.value),
                          style: const TextStyle(
                              fontSize: 19,
                              color: darkText),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: widget.isInfoVisible,
                        replacement: Container(
                          height: 20,
                          width: 55,
                          decoration: BoxDecoration(
                              color: hiddenInfo,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          '${widget.currencyValue} ${widget.abrevCurrencyName}',
                          style: const TextStyle(
                            fontSize: 15,
                            color: lightText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 26),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: lightText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}