import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final visibleProvider = StateProvider((ref) => true);

final userAmountProvider = Provider((ref) => [0.7486532, 1.5687643, 1.892548743, 7.546453, 2.55543443]);

class UserAmountNotifier extends StateNotifier<Decimal> {
  UserAmountNotifier()
      : super(
          Decimal.parse('0'),
        );
}

var userAmountCoinProvider = StateNotifierProvider<UserAmountNotifier, Decimal>(
  (ref) => UserAmountNotifier(),
);
