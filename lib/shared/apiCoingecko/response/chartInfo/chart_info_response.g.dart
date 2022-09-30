// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartInfoResponse _$ChartInfoResponseFromJson(Map<String, dynamic> json) =>
    ChartInfoResponse(
      prices: (json['prices'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$ChartInfoResponseToJson(ChartInfoResponse instance) =>
    <String, dynamic>{
      'prices': instance.prices,
    };
