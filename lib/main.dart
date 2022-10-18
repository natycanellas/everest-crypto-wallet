import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/shared/providers/provider.dart';

import 'l10n/app_localizations.dart';
import 'portfolio/view/crypto_page.dart';
import 'shared/routes/route_generator.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider.state);
    return MaterialApp(
      title: 'Crypto Listing',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(locale.state),
      initialRoute: CryptoPage.route,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
