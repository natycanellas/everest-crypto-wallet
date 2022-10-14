import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
import 'list_view_movimentations.dart';

class MovimentationsBody extends StatelessWidget {
  const MovimentationsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 16,bottom: 24, top: 32),
            child: Text(
              'Movimentações',
              style: TextStyle(
                fontSize: 32,
                color: darkColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListViewMovimentations(),
          ),
        ],
      ),
    );
  }
}
