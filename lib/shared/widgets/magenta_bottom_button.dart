import 'package:flutter/material.dart';

import '../styles/colors.dart';

class MagentaBottomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const MagentaBottomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: magenta),
          child: Text(
            title,
            style: const TextStyle(fontSize: 17, color: Colors.white),
          )),
    );
  }
}
