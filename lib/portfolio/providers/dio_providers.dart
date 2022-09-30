import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/apiCoingecko/endPoint/endPoint_provider.dart';
import '../repository/crypto_repository.dart';
import '../useCase/getCrypto/get_crypto_list_usecase.dart';
import '../useCase/getTotal/get_total_value_usecase.dart';

final getCryptoRepositoryProv = StateProvider(
  (ref) => CryptoRepository(
    cryptoEndpoint: ref.watch(getCryptoEndPointProvider),
  ),
);

final getCryptoUsecaseProv = StateProvider(
  (ref) => GetCryptoListUsecase(
    ref.watch(getCryptoRepositoryProv),
  ),
);

final getTotalUsecaseProv = StateProvider(
  (ref) => GetTotalValueUsecase(
    repository: ref.watch(getCryptoRepositoryProv),
  ),
);

final cryptoListProvider = FutureProvider(
  (ref) => ref.watch(getCryptoUsecaseProv).execute(),
);

final getTotalProvider = FutureProvider.family<Decimal, List<double>>(
  (ref, args) => ref.watch(getTotalUsecaseProv).getTotalMoney(args),
);
