// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoResponse _$CryptoResponseFromJson(Map<String, dynamic> json) =>
    CryptoResponse(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      price_change_percentage_24h:
          (json['price_change_percentage_24h'] as num).toDouble(),
      current_price: (json['current_price'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoResponseToJson(CryptoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'price_change_percentage_24h': instance.price_change_percentage_24h,
      'current_price': instance.current_price,
    };
