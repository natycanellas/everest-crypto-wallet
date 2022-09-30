import 'package:dio/dio.dart';

import '../api_request_url.dart';

class CryptoChartEndpoint {
 final Dio dio;
  CryptoChartEndpoint({
    required this.dio,
  });
  Future<Response> getChartInfo(String id) {
    return dio.get('$baseUrlApi/$id/market_chart?vs_currency=brl&days=90&interval=daily');
  }
}
