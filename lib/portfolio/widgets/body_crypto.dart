import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';
import 'list_view_cryptos.dart';
import 'title_crypto_row.dart';
import 'total_value_column.dart';

class BodyCrypto extends StatefulHookConsumerWidget {
  const BodyCrypto({
    Key? key,
  }) : super(key: key);
  @override
  ConsumerState<BodyCrypto> createState() => _BodyCryptoState();
}

class _BodyCryptoState extends ConsumerState<BodyCrypto> {
  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibleProvider.state);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleCryptoRow(),
          const SizedBox(height: 8),
          TotalValueColumn(
            isVisibleState: isVisibleState,
          ),
          ListViewCryptos(
            ref: ref,
            isVisibleState: isVisibleState,
          )
        ],
      ),
    );
  }
}
