import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api_request_url.dart';
import 'cryptos_endpoint.dart';

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
