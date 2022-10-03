import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'cryptos_endpoint.dart';

import '../api_request_url.dart';

final cryptosEndPointProvider = Provider(
  (ref) {
    return CryptosEndpoint(
      Dio(
        BaseOptions(
          baseUrl: baseUrlApi,
        ),
      ),
    );
  },
);
