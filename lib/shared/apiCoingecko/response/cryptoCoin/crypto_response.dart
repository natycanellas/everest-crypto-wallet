import 'package:json_annotation/json_annotation.dart';

part 'crypto_response.g.dart';

@JsonSerializable()
class CryptoResponse {
  String id;
  String symbol;
  String name;
  String image;
  double price_change_percentage_24h;
  double current_price;

  CryptoResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.price_change_percentage_24h,
    required this.current_price,
  });
    factory CryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoResponseToJson(this);
}
