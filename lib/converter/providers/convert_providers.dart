import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/models/crypto_model.dart';
import '../../portfolio/providers/dio_providers.dart';

final secondSelectedCoinProvider = StateProvider<CryptoModel>((ref) {
  return ref.read(cryptoListProvider).value!.cryptoModelList.last;
});

final valueCryptoTextFieldControllerProvider = StateProvider(
  (ref) => TextEditingController(),
);

final converterReaisProvider = StateProvider(
  (ref) => Decimal.parse('0'),
);

final totalCalcProvider = StateProvider((ref) => 0.0);

final isEnabledButtonProvider = StateProvider((ref) => false);
