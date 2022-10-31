import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_first_task/shared/apiCoingecko/response/chartInfo/chart_info_response.dart';
import 'package:warren_first_task/shared/apiCoingecko/response/cryptoCoin/crypto_response.dart';

void main() {
  setUp(() {
    final faker = Faker();
  });

  test('WHEN the response is working, THEN ensure it returns info from api',
      () async {
    CryptoResponse cryptoResponse = CryptoResponse(
      id: faker.person.toString(),
      symbol: faker.lorem.word(),
      name: faker.lorem.word(),
      image: faker.image.image(),
      price_change_percentage_24h: faker.randomGenerator.integer(10).toDouble(),
      current_price: faker.randomGenerator.integer(10000).toDouble(),
    );
    Map<String, dynamic> result = cryptoResponse.toJson();
    expect(result.isNotEmpty, true);
  });

  test(
      'WHEN the chartInfoResponse is working, THEN ensure it returns the info from api',
      () async {
    ChartInfoResponse chartResponse = ChartInfoResponse(prices: [
      [
        faker.randomGenerator.integer(1000),
        faker.randomGenerator.integer(1000),
      ]
    ]);
    Map<String, dynamic> result = chartResponse.toJson();

    expect(result.isEmpty, false);
  });
}
