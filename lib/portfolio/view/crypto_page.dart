import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/shared/providers/crypto_list_provider.dart';

import '../../shared/widgets/bottom_navigation_crypto.dart';
import '../../shared/models/crypto_model.dart';
import '../providers/providers.dart';
import '../widgets/currency_list_card.dart';
import '../widgets/title_crypto_row.dart';
import '../widgets/total_value_column.dart';

class CryptoPage extends StatefulHookConsumerWidget {
  const CryptoPage({Key? key}) : super(key: key);

  static const route = '/crypto-page';

  @override
  ConsumerState<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends ConsumerState<CryptoPage> {

  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibleProvider.state);

    var cryptoList = ref.watch(cryptoListProvider);

    Decimal getTotalOwned(List<CryptoModel> list) {
      Decimal total = Decimal.parse('0');

      for (CryptoModel crypto in list) {
        total += crypto.value;
      }
      return total;
    }

    final Decimal totalAmountOwned = getTotalOwned(cryptoList);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleCryptoRow(),
            const SizedBox(height: 8),
            TotalValueColumn(
              isVisibleState: isVisibleState,
              totalAmountOwned: totalAmountOwned,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cryptoList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const Divider(thickness: 1.5,),
                      CurrencyListCard(
                        coin: cryptoList[index],
                        isInfoVisible: isVisibleState.state,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationCrypto(selectedIndex: 0),
    );
  }
}
