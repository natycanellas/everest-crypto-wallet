import '../../converter/view/converter_page.dart';
import '../../details/view/details_page.dart';
import '../../movimentations/view/movimentations_page.dart';
import '../../portfolio/view/crypto_page.dart';
import '../../review/view/review_page.dart';
import '../../success/view/success_page.dart';

var appRoutes = {
  CryptoPage.route: (context) => const CryptoPage(),
  MovimentationsPage.route: (context) => const MovimentationsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
  ConverterPage.route: (context) => const ConverterPage(),
  ReviewPage.route: (context) => const ReviewPage(),
  SuccessPage.route: (context) => const SuccessPage(),
};