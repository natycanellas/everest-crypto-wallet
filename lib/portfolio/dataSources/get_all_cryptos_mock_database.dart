import 'package:decimal/decimal.dart';
import 'package:warren_first_task/portfolio/models/crypto_model.dart';
import 'package:warren_first_task/shared/assets_images.dart';

class GetAllCryptosMockDatabase {
  List<CryptoModel> getAllCryptos() {
    return [
      CryptoModel(
        abbreviation: 'BTC',
        name: 'Bitcoin',
        imagePath: btcImage,
        value: Decimal.parse('6557'),
        coinAmount: 0.65,
      ),
      CryptoModel(
        abbreviation: 'ETH',
        name: 'Ethereum',
        imagePath: ethImage,
        value: Decimal.parse('7995'),
        coinAmount: 0.94,
      ),
      CryptoModel(
        abbreviation: 'LTC',
        name: 'Litecoin',
        imagePath: ltcImage,
        value: Decimal.parse('245'),
        coinAmount: 0.81,
      ),
    ];
  }
}
