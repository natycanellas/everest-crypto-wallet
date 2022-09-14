import 'package:decimal/decimal.dart';

class CryptoModel {
  String abbreviation;
  String name;
  String imagePath;
  final Decimal value;
  final double coinAmount;

  CryptoModel({
    required this.abbreviation,
    required this.name,
    required this.imagePath,
    required this.value,
    required this.coinAmount,
  });
}
