import 'package:flutter/material.dart';

import '../widget/app_bar_success.dart';
import '../widget/body_success.dart';

class SuccessPage extends StatelessWidget {
  static const route = '/success-page';

  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      appBar: AppBarSuccess(),
      backgroundColor: Colors.white,
      body: BodySuccess(),
    );
  }
}

