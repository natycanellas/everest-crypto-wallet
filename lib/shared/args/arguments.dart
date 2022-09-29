import 'package:decimal/decimal.dart';
import 'package:warren_first_task/portfolio/useCase/models/crypto_model.dart';

class Arguments {
  CryptoModel cryptoModel;
  Decimal userAmountCrypto;

  Arguments({
    required this.cryptoModel,
    required this.userAmountCrypto,
  });
}
