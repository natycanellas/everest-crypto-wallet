import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/dio_providers.dart';
import '../providers/providers.dart';
import 'currency_list_card.dart';

class ListViewCryptos extends StatelessWidget {
  const ListViewCryptos({
    Key? key,
    required this.ref,
    required this.isVisibleState,
  }) : super(key: key);

  final WidgetRef ref;
  final StateController<bool> isVisibleState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: ref.watch(cryptoListProvider.future),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.cryptoModelList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const Divider(
                      thickness: 1.5,
                    ),
                    CurrencyListCard(
                      coin: snapshot.data!.cryptoModelList[index],
                      isInfoVisible: isVisibleState.state,
                      userAmountCrypto: Decimal.parse(
                          ref.watch(userAmountProvider)[index].toString()),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
