
import 'package:decimal/decimal.dart';

class CryptoModel {
  String id;
  String symbol;
  String name;
  String image;
  double variation;
  double actualPrice;

  CryptoModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.variation,
    required this.actualPrice,
  });

  double userValueMoney(Decimal userAmount) {
    return actualPrice * userAmount.toDouble();
  }
}
