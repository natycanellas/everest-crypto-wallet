import '../../../shared/apiCoingecko/response/cryptoCoin/crypto_mapper.dart';
import '../../repository/crypto_repository.dart';
import '../../models/crypto_list_model.dart';

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
