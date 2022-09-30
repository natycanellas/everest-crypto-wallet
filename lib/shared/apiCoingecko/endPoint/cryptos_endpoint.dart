import 'package:dio/dio.dart';

import '../api_request_url.dart';

class CryptosEndpoint {
  final Dio _dio;
  CryptosEndpoint(this._dio);

  Future<Response> getCryptoList() async {
    return await _dio.get(getApi, queryParameters: {
      'ids': 'bitcoin,litecoin,ethereum,dogecoin,solana',
      'vs_currency': 'brl'
    });
  }

  Future<Response> getChartInfo(String id) async {
    return await _dio.get(
      '/$id/market_chart?vs_currency=brl&days=90&interval=daily',
    );
  }
}
