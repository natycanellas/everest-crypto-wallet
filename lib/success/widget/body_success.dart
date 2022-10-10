
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../shared/assets/images.dart';
import '../../shared/styles/colors.dart';

class BodySuccess extends StatelessWidget {
  const BodySuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(lottieSuccess, repeat: false, height: 100),
        const Text(
          'Conversão efetuada',
          style: TextStyle(
            fontSize: 34,
            color: darkColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Conversão de moeda efetuada com sucesso!',
          style: TextStyle(
            fontSize: 17,
            color: lightColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ));
  }
}