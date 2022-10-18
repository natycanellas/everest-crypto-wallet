import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/styles/colors.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Text(
            AppLocalizations.of(context)!.reviewQuote,
            style: const TextStyle(
              fontSize: 34,
              color: darkColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}