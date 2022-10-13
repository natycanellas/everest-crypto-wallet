import '../../../shared/apiCoingecko/response/cryptoCoin/crypto_mapper.dart';
import '../../models/crypto_list_model.dart';
import '../../repository/crypto_repository.dart';

class GetCryptoListUsecase {
  final CryptoRepository repository;

  GetCryptoListUsecase(
    this.repository,
  );

  Future<CryptoListModel> execute() async {
    var response = await repository.getCryptoList();
    return response.toViewData();
  }
}
