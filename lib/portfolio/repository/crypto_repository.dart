import '../../shared/apiCoingecko/endPoint/cryptos_endpoint.dart';
import '../../shared/apiCoingecko/response/cryptoCoin/crypto_response.dart';

class CryptoRepository {
  final CryptosEndpoint cryptoEndpoint;
  CryptoRepository({
    required this.cryptoEndpoint,
  });

  Future<List<CryptoResponse>> getCryptoList() async {
    final result = await cryptoEndpoint.getCryptoList();
    return List<CryptoResponse>.from(
      result.data.map(
        (item) => CryptoResponse.fromJson(item),
      ),
    );
  }
}
