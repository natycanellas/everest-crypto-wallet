import '../endPoint/crypto_endpoint.dart';
import '../response/crypto_response.dart';

class CryptoRepository {
  final CryptoEndpoint cryptoEndpoint;
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
