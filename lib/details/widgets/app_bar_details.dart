import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/styles/colors.dart';
import '../providers/providers.dart';

class AppBarDetails extends HookConsumerWidget implements PreferredSizeWidget {
  const AppBarDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.details,
        style: const TextStyle(
          color: darkColor,
          fontWeight: FontWeight.w700,
          fontSize: 23,
        ),
      ),
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/crypto-page');
          ref.watch(selectDaySpanProvider.notifier).state = 5;
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
