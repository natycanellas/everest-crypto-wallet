import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/providers/provider.dart';
import '../../shared/styles/colors.dart';
import '../providers/providers.dart';
import 'drop_down_button_locale.dart';

class TitleCryptoRow extends StatefulHookConsumerWidget {
  const TitleCryptoRow({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TitleCryptoRow> createState() => _TitleRowState();
}

class _TitleRowState extends ConsumerState<TitleCryptoRow> {
  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibleProvider.state);
    var language = ref.watch(localeProvider.state);

    String getTouchedValue() {
      String value = '';
      if (language.state == 'pt') {
        value = 'Brazil';
      } else if (language.state == 'en') {
        value = 'USA';
      } else if (language.state == 'fr') {
        value = 'France';
      } else {
        value = 'Spain';
      }
      return value;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.cryptoTitle,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: magenta,
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: DropDownButtonLocale(
                  touchedValue: getTouchedValue(),
                  onChangeDrop: (value) {
                    if (value == 'Brazil') {
                      language.state = 'pt';
                    } else if (value == 'USA') {
                      language.state = 'en';
                    } else if (value == 'France') {
                      language.state = 'fr';
                    } else {
                      language.state = 'es';
                    }
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  isVisibleState.state
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 22,
                ),
                onPressed: () {
                  isVisibleState.state = !isVisibleState.state;
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
