import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/converter/providers/convert_providers.dart';
import 'package:warren_first_task/l10n/app_localizations.dart';
import 'package:warren_first_task/portfolio/models/crypto_list_model.dart';
import 'package:warren_first_task/portfolio/models/crypto_model.dart';
import 'package:warren_first_task/portfolio/providers/dio_providers.dart';
import 'package:warren_first_task/shared/routes/route_generator.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;
  final Locale? locale;

  const SetupWidgetTester({Key? key, required this.child, this.locale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bitcoin = CryptoModel(
      id: 'bitcoin',
      symbol: 'BTC',
      name: 'Bitcoin',
      image: Faker().image.image(),
      variation: Decimal.one.toDouble(),
      actualPrice: Faker().randomGenerator.integer(100000).toDouble(),
    );
    final ethereum = CryptoModel(
      id: 'ethereum',
      symbol: 'ETH',
      name: 'Ethereum',
      image: Faker().image.image(),
      variation: Decimal.one.toDouble(),
      actualPrice: Faker().randomGenerator.integer(1000).toDouble(),
    );

    return ProviderScope(
      overrides: [
        secondSelectedCoinProvider.overrideWithValue(
          StateController(ethereum),
        ),
        converterReaisProvider.overrideWithValue(
          StateController(Decimal.ten),
        ),
        valueCryptoTextFieldControllerProvider.overrideWithValue(
          StateController(
            TextEditingController(text: '0.0008'),
          ),
        ),
        totalCalcProvider.overrideWithValue(
          StateController(
            Decimal.ten.toDouble(),
          ),
        ),
        cryptoListProvider.overrideWithValue(
          AsyncValue.data(
            CryptoListModel(
              cryptoModelList: [
                bitcoin,
                ethereum,
              ],
            ),
          ),
        ),
      ],
      child: MaterialApp(
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}

Future loadPage(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    SetupWidgetTester(child: child),
  );
}
