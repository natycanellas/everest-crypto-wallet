import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warren_first_task/portfolio/repository/crypto_repository.dart';
import 'package:warren_first_task/shared/apiCoingecko/endPoint/cryptos_endpoint.dart';

import '../helper/api_factory.dart';

class CryptosEndpointMock extends Mock implements CryptosEndpoint {}

void main() {
  late CryptosEndpointMock cryptosEndpointMock;
  late CryptoRepository cryptoRepository;
  setUp(() {
    cryptosEndpointMock = CryptosEndpointMock();
    cryptoRepository = CryptoRepository(cryptoEndpoint: cryptosEndpointMock);
  });
  test(
      'WHEN getCryptoList is requested by cryptoRepository THEN getCryptoListfrom cryptoEndpoint is called ',
      () async {
    when((() => cryptosEndpointMock.getCryptoList())).thenAnswer((_) async =>
        Response(
            data: ApiFactory.getCryptoList(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await cryptoRepository.getCryptoList();
    verify(() => cryptosEndpointMock.getCryptoList()).called(1);
  });
}
