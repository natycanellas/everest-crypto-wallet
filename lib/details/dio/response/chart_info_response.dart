import 'package:json_annotation/json_annotation.dart';

part 'chart_info_response.g.dart';

@JsonSerializable()
class ChartInfoResponse {
  final List<List<num>> prices;
  ChartInfoResponse({
    required this.prices,
  });
  factory ChartInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ChartInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChartInfoResponseToJson(this);
}
