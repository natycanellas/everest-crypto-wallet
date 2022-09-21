import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/crypto_model.dart';

var daySpanProvider = StateProvider((ref) => 5);

var cryptoCoinProvider = StateNotifierProvider<CryptoNotifier, CryptoModel>(
  (ref) => CryptoNotifier(),
);

class CryptoNotifier extends StateNotifier<CryptoModel> {
  CryptoNotifier()
      : super(
          CryptoModel(
            abbreviation: '',
            name: '',
            imagePath: '',
            coinAmount: 0,
            value: Decimal.parse('0'),
            variation: 0.3,
            yValues: [Decimal.parse('0')],
            actualPrice: Decimal.parse('0'),
          ),
        );
  void getVariantionChanges() {
    state.variation = ((double.parse(state.yValues![0].toString()) /
                double.parse(state.yValues![1].toString())) -
            1) *
        100;
  }
}

var actualPriceProvider = StateNotifierProvider<ActualPriceNotifier, Decimal>(
  (ref) => ActualPriceNotifier(),
);

class ActualPriceNotifier extends StateNotifier<Decimal> {
  ActualPriceNotifier() : super(Decimal.parse('0'));

  void getActualPrice(CryptoModel crypto) {
    state = (crypto.yValues![0]);
  }
}
