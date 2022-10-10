import 'package:decimal/decimal.dart';

import '../../../shared/apiCoingecko/response/cryptoCoin/crypto_mapper.dart';
import '../../models/crypto_list_model.dart';
import '../../repository/crypto_repository.dart';

class GetTotalValueUsecase {
  final CryptoRepository repository;
  GetTotalValueUsecase({
    required this.repository,
  });

  Future<Decimal> getTotalMoney(List<double> userAmount) async {
    var response = await repository.getCryptoList();
    Decimal total = Decimal.parse('0');
    CryptoListModel cryptoValues = response.toViewData();
    for (var i = 0; i < userAmount.length; i++) {
      total += Decimal.parse(userAmount[i].toString()) *
          Decimal.parse(cryptoValues.cryptoModelList[i].actualPrice.toString());
    }
    return total;
  }
}
