import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warren_first_task/details/repository/chart_info_repo.dart';
import 'package:warren_first_task/details/useCase/get_chart_info_usecase.dart';
import 'package:warren_first_task/portfolio/repository/crypto_repository.dart';
import 'package:warren_first_task/portfolio/useCase/getCrypto/get_crypto_list_usecase.dart';
import 'package:warren_first_task/portfolio/useCase/getTotal/get_total_value_usecase.dart';
import 'package:warren_first_task/shared/apiCoingecko/response/chartInfo/chart_info_response.dart';
import 'package:warren_first_task/shared/apiCoingecko/response/cryptoCoin/crypto_response.dart';

class CryptoRepositoryMock extends Mock implements CryptoRepository {}

class ChartInfoRepoMock extends Mock implements ChartInfoRepo {}

void main() {
  late CryptoRepositoryMock cryptoRepoMock;
  late GetCryptoListUsecase cryptoListUsecase;
  late GetTotalValueUsecase totalValueUsecase;
  late ChartInfoRepoMock chartRepoMock;
  late GetChartInfoUsecase chartUsecase;

  setUp(() {
    cryptoRepoMock = CryptoRepositoryMock();
    cryptoListUsecase = GetCryptoListUsecase(cryptoRepoMock);
    totalValueUsecase = GetTotalValueUsecase(repository: cryptoRepoMock);
    chartRepoMock = ChartInfoRepoMock();
    chartUsecase = GetChartInfoUsecase(repo: chartRepoMock);
  });

  test(
      'WHEN getCryptoList is requested, THEN ensure the cryptoUsecase is being called',
      () async {
    when(() => cryptoRepoMock.getCryptoList()).thenAnswer(
      (_) async => [
        CryptoResponse(
          id: faker.person.toString(),
          symbol: faker.lorem.word(),
          name: faker.lorem.word(),
          image: faker.image.image(),
          price_change_percentage_24h:
              faker.randomGenerator.integer(10).toDouble(),
          current_price: faker.randomGenerator.integer(10000).toDouble(),
        ),
      ],
    );
    await cryptoListUsecase.execute();
    await totalValueUsecase
        .getTotalMoney([faker.randomGenerator.integer(10).toDouble()]);
  });

  List<List<num>> getChartInfoList() {
    List<List<num>> chartList = [
      [1657594850324, 19967.60020613295]
    ];
    for (var i = 0; i < 90; i++) {
      chartList.add(
        [1657594850324, 19967.60020613295]
      );
    }
    return chartList;
  }

  test(
      'WHEN the getChartInfo is working, THEN ensure ChartInfoUsecase is being called',
      () async {
    when(
      () => chartRepoMock.getChartInfoList('bitcoin'),
    ).thenAnswer(
      (_) async => ChartInfoResponse(prices: getChartInfoList()),
    );
    await chartUsecase.getInfo('bitcoin');
  });
}
