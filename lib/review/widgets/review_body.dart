import 'package:flutter/material.dart';
import 'package:warren_first_task/shared/styles/colors.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Text(
            'Revise os dados da sua conversão',
            style: TextStyle(
              fontSize: 34,
              color: darkColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}