import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/shared/providers/provider_shared.dart';

import '../../shared/styles/colors.dart';

class AppBarDetails extends HookConsumerWidget  implements PreferredSizeWidget {
  const AppBarDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text(
        'Detalhes',
        style: TextStyle(
          color: darkColor,
          fontWeight: FontWeight.w700,
          fontSize: 23,
        ),
      ),
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/crypto-page');
          ref.watch(daySpanProvider.state).state = 5;
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: darkColor,
        ),
      ),
      shadowColor: Colors.white30,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(54);
}
