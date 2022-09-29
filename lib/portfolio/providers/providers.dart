import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final visibleProvider = StateProvider((ref) => true);

final userAmountProvider = Provider((ref) => [0.74, 1.56, 0.89, 3.54, 0.55]);

class UserAmountNotifier extends StateNotifier<Decimal> {
  UserAmountNotifier()
      : super(
          Decimal.parse('0'),
        );
}

var userAmountCoinProvider = StateNotifierProvider<UserAmountNotifier, Decimal>(
  (ref) => UserAmountNotifier(),
);
