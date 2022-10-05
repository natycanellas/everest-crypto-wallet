import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/convert_providers.dart';

import '../../shared/styles/colors.dart';

class AppBarConverter extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarConverter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertReais = ref.watch(converterReaisProvider.state);
    final valueController =
        ref.watch(valueCryptoTextFieldControllerProvider.state);
    final estimated = ref.watch(totalCalcProvider.state);

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: darkColor,
        onPressed: (() {
          valueController.state.clear();
          convertReais.state = Decimal.parse('0');
          estimated.state = 0.0;
          Navigator.of(context).pop();
        }),
      ),
      elevation: 0.85,
      backgroundColor: Colors.white,
      title: const Text(
        'Converter',
        style: TextStyle(
          fontSize: 20,
          color: darkColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
