import '../../details/view/details_page.dart';
import '../../movimentations/view/movimentations_page.dart';
import '../../portfolio/view/crypto_page.dart';

var appRoutes = {
  CryptoPage.route: (context) => const CryptoPage(),
  MovimentationsPage.route: (context) => const MovimentationsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
};