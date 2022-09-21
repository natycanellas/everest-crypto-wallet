import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class ConvertButtonDetails extends StatelessWidget {
  const ConvertButtonDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: magenta),
          child: const Text(
            'Converter moeda',
            style: TextStyle(fontSize: 17, color: Colors.white),
          )),
    );
  }
}