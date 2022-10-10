import 'package:flutter/material.dart';

import '../../portfolio/models/crypto_model.dart';
import '../../shared/args/arguments.dart';
import '../widgets/bottom_sheet_review.dart';
import '../widgets/review_body.dart';

class ReviewPage extends StatelessWidget {

  static const route = '/review-page'; 

  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    CryptoModel cryptoCoin = args.cryptoModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Revisar',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: const ReviewBody(),
      bottomSheet: BottomSheetReview(firstCrypto: cryptoCoin),
    );
  }
}



