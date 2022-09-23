
import 'package:decimal/decimal.dart';

class CryptoModel {
  String abbreviation;
  String name;
  String imagePath;
  double coinAmount;
  double? variation;
  Decimal value;
  Decimal actualPrice;
  List<Decimal>? yValues;

  CryptoModel({
    required this.abbreviation,
    required this.name,
    required this.imagePath,
    required this.coinAmount,
    this.variation,
    required this.value,
    required this.actualPrice,
    this.yValues,
  });
}
