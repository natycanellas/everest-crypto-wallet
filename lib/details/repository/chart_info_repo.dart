import '../../shared/apiCoingecko/endPoint/cryptos_endpoint.dart';
import '../../shared/apiCoingecko/response/chartInfo/chart_info_response.dart';


class ChartInfoRepo {
  final CryptosEndpoint endpoint;
  ChartInfoRepo({
    required this.endpoint,
  });
  Future<ChartInfoResponse> getChartInfoList(String id) async {
    final result = await endpoint.getChartInfo((id));
    return ChartInfoResponse.fromJson(result.data);
  }
}
