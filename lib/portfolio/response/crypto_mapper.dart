
import '../useCase/models/crypto_list_model.dart';
import '../useCase/models/crypto_model.dart';
import 'crypto_response.dart';

extension CryptoMapper on List<CryptoResponse> {
  CryptoListModel toViewData() {
    return CryptoListModel(
        cryptoModelList: map(
      (item) => CryptoModel(
        id: item.id,
        symbol: item.symbol,
        name: item.name,
        image: item.image,
        variation: item.price_change_percentage_24h,
        actualPrice: item.current_price,
      ),
    ).toList());
  }
}
