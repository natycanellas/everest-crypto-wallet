
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../converter/providers/convert_providers.dart';
import '../../portfolio/view/crypto_page.dart';
import '../../shared/styles/colors.dart';

class AppBarSuccess extends HookConsumerWidget implements PreferredSizeWidget {
  const AppBarSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertReais = ref.watch(converterReaisProvider.state);
    final valueController =
        ref.watch(valueCryptoTextFieldControllerProvider.state);
    final estimated = ref.watch(totalCalcProvider.state);
    final isEnabled = ref.watch(isEnabledButtonProvider.state);
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          valueController.state.clear();
          convertReais.state = Decimal.parse('0');
          estimated.state = 0.0;
          isEnabled.state = false;
          Navigator.of(context).popAndPushNamed(CryptoPage.route);
        },
        icon: const Icon(
          Icons.close_rounded,
          color: darkColor,
          size: 25,
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(54);
}
