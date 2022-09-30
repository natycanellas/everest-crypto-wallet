import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/provider.dart';
import '../api_request_url.dart';
import 'crypto_chart_endpoint.dart';
import 'crypto_endpoint.dart';

final getCryptoEndPointProvider = Provider(
  (ref) {
    final dio = Dio(BaseOptions(baseUrl: baseUrlApi));
    return CryptoEndpoint(dio: dio);
  }
);

final getChartInfoEndpointProvider = StateProvider(
  (ref) => CryptoChartEndpoint(
    dio: ref.watch(dioProvider),
  ),
);
