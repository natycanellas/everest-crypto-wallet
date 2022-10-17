import 'package:flutter/material.dart';
import 'package:warren_first_task/l10n/app_localizations.dart';

import '../../shared/styles/colors.dart';
import 'list_view_movimentations.dart';

class MovimentationsBody extends StatelessWidget {
  const MovimentationsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,bottom: 24, top: 32),
            child: Text(
              AppLocalizations.of(context)!.movimentations,
              style: const TextStyle(
                fontSize: 32,
                color: darkColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Expanded(
            child: ListViewMovimentations(),
          ),
        ],
      ),
    );
  }
}
