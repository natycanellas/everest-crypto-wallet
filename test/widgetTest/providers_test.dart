import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/converter/providers/convert_providers.dart';
import 'package:warren_first_task/details/providers/chart_providers.dart';
import 'package:warren_first_task/details/providers/providers.dart';
import 'package:warren_first_task/movimentations/providers/movimentations_provider.dart';
import 'package:warren_first_task/portfolio/providers/dio_providers.dart';
import 'package:warren_first_task/portfolio/providers/providers.dart';
import 'package:warren_first_task/shared/providers/provider.dart';

import '../helper/setup_widget_tester.dart';

class ProvidersTest extends HookConsumerWidget {
  const ProvidersTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dioProvider);
    ref.watch(localeProvider);
    ref.watch(getCryptoRepositoryProv);
    ref.watch(getCryptoUsecaseProv);
    ref.watch(getTotalUsecaseProv);
    ref.watch(cryptoListProvider);
    ref.watch(visibleProvider);
    ref.watch(userAmountProvider);
    ref.watch(secondSelectedCoinProvider);
    ref.watch(valueCryptoTextFieldControllerProvider);
    ref.watch(converterReaisProvider);
    ref.watch(totalCalcProvider);
    ref.watch(isEnabledButtonProvider);
    ref.watch(userAmountCoinProvider);
    ref.watch(movimentationsListProvider);
    ref.watch(getChartInfoRepoProvider);
    ref.watch(getChartInfoUseCaseProvider);
    ref.watch(selectDaySpanProvider);

    return Container();
  }
}

void main() {
  testWidgets(
      'WHEN the providers are working, THEN ensure the app is also working',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const SetupWidgetTester(
        child: ProvidersTest(),
      ),
    );

    await tester.pump(const Duration(seconds: 3));
  });
}
