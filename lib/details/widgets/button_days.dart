import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styles/colors.dart';
import '../providers/providers.dart';

class ButtonDays extends StatefulHookConsumerWidget {
  final String daySpan;
  late int numberDays;

  ButtonDays({
    Key? key,
    required this.daySpan,
    required this.numberDays,
  }) : super(key: key);

  @override
  ConsumerState<ButtonDays> createState() => _ButtonDaysState();
}

class _ButtonDaysState extends ConsumerState<ButtonDays> {
  @override
  Widget build(BuildContext context) {
    var days = ref.watch(selectDaySpanProvider.state);

    return SizedBox(
      height: 29,
      width: 47,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              widget.numberDays == days.state ? Colors.grey[300] : null),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.6),
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            days.state = widget.numberDays;
          });
        },
        child: Text(
          widget.daySpan,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: widget.numberDays == days.state ? darkColor : lightColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
