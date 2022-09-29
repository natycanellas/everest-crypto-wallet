import 'package:dio/dio.dart';

import '../../shared/api_request_url.dart';

class CryptoEndpoint {
  final Dio dio;

  CryptoEndpoint({
    required this.dio,
  });

  Future<Response> getCryptoList() {
    return dio.get(getApi, queryParameters: {
      'ids': 'bitcoin,litecoin,ethereum,dogecoin,solana',
      'vs_currency': 'brl'
    });
  }
}
