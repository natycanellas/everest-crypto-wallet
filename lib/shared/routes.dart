import 'package:warren_first_task/details/view/details_page.dart';
import 'package:warren_first_task/movimentations/view/movimentations_page.dart';

import '../portfolio/view/crypto_page.dart';

var appRoutes = {
  CryptoPage.route: (context) => const CryptoPage(),
  MovimentationsPage.route: (context) => const MovimentationsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
};