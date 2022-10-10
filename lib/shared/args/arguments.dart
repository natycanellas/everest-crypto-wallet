import 'package:decimal/decimal.dart';

import '../../portfolio/models/crypto_model.dart';

class Arguments {
  CryptoModel cryptoModel;
  Decimal? userAmountCrypto;

  Arguments({
    required this.cryptoModel,
    this.userAmountCrypto,
  });
}
