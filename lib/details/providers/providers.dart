import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/useCase/models/crypto_model.dart';

final selectDaySpanProvider = StateProvider((ref) => 5);

class CryptoNotifier extends StateNotifier<CryptoModel> {
  CryptoNotifier()
      : super(
          CryptoModel(
            id: '',
            symbol: '',
            name: '',
            image: '',
            variation: 0.0,
            actualPrice: 0.0,
          ),
        );
}

var cryptoModelProvider = StateNotifierProvider<CryptoNotifier, CryptoModel>(
  (ref) => CryptoNotifier(),
);
