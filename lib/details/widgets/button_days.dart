import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/shared/providers/provider_shared.dart';
import 'package:warren_first_task/shared/styles/colors.dart';

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
    var days = ref.watch(daySpanProvider.state);
    var crypto = ref.watch(cryptoCoinProvider.notifier).state;

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
              ref
                  .read(cryptoCoinProvider.notifier)
                  .getVariantionChanges();
              ref
                  .read(actualPriceProvider.notifier)
                  .getActualPrice(crypto);
                  crypto.actualPrice = ref.read(actualPriceProvider.notifier).state;
                  crypto.variation = ref.read(cryptoCoinProvider.notifier).state.variation;
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
          )),
    );
  }
}
