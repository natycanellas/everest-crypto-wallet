
import '../../shared/apiCoingecko/endPoint/crypto_chart_endpoint.dart';
import '../../shared/apiCoingecko/response/chartInfo/chart_info_response.dart';


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
