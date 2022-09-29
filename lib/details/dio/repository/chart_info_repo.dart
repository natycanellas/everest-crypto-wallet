
import 'package:warren_first_task/details/dio/endPoint/crypto_chart_endpoint.dart';
import 'package:warren_first_task/details/dio/response/chart_info_response.dart';

class ChartInfoRepo {
  final CryptoChartEndpoint endpoint;
  ChartInfoRepo({
    required this.endpoint,
  });
  Future<ChartInfoResponse> getChartInfoList(String id) async {
    final result = await endpoint.getChartInfo((id));
    return ChartInfoResponse.fromJson(result.data);
  }
}
