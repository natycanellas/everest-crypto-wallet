import 'package:flutter/material.dart';

import '../../converter/view/converter_page.dart';
import '../../details/view/details_page.dart';
import '../../movimentations/view/movimentations_page.dart';
import '../../portfolio/view/crypto_page.dart';
import '../../review/view/review_page.dart';
import '../../success/view/success_page.dart';
import '../args/arguments.dart';
import '../styles/colors.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CryptoPage.route:
        return MaterialPageRoute(
          builder: (context) => const CryptoPage(),
        );
      case MovimentationsPage.route:
        return MaterialPageRoute(
          builder: (context) => const MovimentationsPage(),
        );
      case DetailsPage.route:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Arguments;
            return DetailsPage(
              crypto: args.cryptoModel,
              userAmount: args.userAmountCrypto!,
            );
          },
        );
      case ConverterPage.route:
        return MaterialPageRoute(
          builder: (context){
            final args = settings.arguments as Arguments;
            return ConverterPage(
              cryptoModelCoin: args.cryptoModel,
              userAmount: args.userAmountCrypto!,
            );
          },
        );
      case ReviewPage.route:
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Arguments;
            return ReviewPage(cryptoCoin: args.cryptoModel);
          },
        );
      case SuccessPage.route:
        return MaterialPageRoute(
          builder: (context) => const SuccessPage(),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                      child: Text(
                    'Rota não definida',
                    style: TextStyle(fontSize: 32, color: darkColor),
                  )),
                ));
    }
  }
}
