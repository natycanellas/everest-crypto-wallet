import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warren_first_task/shared/apiCoingecko/endPoint/cryptos_endpoint.dart';

import '../helper/api_factory.dart';
import 'crypto_endpoint_test.dart';

void main() {
  late Response<List<List<num>>> success;
  late DioMock dioMock;
  late CryptosEndpoint endpoint;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

  mockResponse(List<List<num>> factory, int statusCode) =>
      Response(
        data: factory,
        statusCode: statusCode,
        requestOptions: RequestOptions(
          path: faker.internet.httpUrl(),
        ),
      );

  setUp(() {
    dioMock = DioMock();
    endpoint = CryptosEndpoint(dioMock);
    success = mockResponse(ApiFactory.getPrices(), 200);
  });

  test('WHEN getPrices is requested THEN ensure it returns the 200 status code',
      () async {
    mockGetResponse().thenAnswer((_) async => success);
    final result = await endpoint.getChartInfo('bitcoin');
    expect(result.statusCode, equals(200));
    expect(result, success);
  });
}
