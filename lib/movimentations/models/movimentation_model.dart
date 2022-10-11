import 'package:decimal/decimal.dart';

import '../../portfolio/models/crypto_model.dart';

class MovimentationModel {
  CryptoModel firstCryptoModel;
  CryptoModel secondCryptoModel;
  Decimal valueFirstCrypto;
  Decimal valueSecondCrypto;
  Decimal conversionInReais;
  DateTime conversionDate;
  MovimentationModel({
    required this.firstCryptoModel,
    required this.secondCryptoModel,
    required this.valueFirstCrypto,
    required this.valueSecondCrypto,
    required this.conversionInReais,
    required this.conversionDate,
  });
}
