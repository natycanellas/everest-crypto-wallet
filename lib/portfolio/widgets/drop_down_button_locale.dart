
import 'package:flutter/material.dart';

class DropDownButtonLocale extends StatelessWidget {
  final String touchedValue;
  final void Function(dynamic)? onChangeDrop;
  const DropDownButtonLocale({
    Key? key,
    required this.onChangeDrop,
    required this.touchedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: [
        DropdownMenuItem(
          value: 'Brazil',
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/0/01/Brazil_flag_300.png',
            width: 60,
          ),
        ),
        DropdownMenuItem(
          value: 'USA',
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/b/b2/US_flag_large_51_stars.png',
            width: 60,
          ),
        ),
        DropdownMenuItem(
          value: 'Spain',
          child: Image.network(
            'https://stuffedeyes.files.wordpress.com/2018/06/spain-2906824_960_720.png',
            width: 60,
          ),
        ),
        DropdownMenuItem(
          value: 'France',
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/6/62/Flag_of_France.png',
            width: 60,
          ),
        ),
      ],
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8),
        border: InputBorder.none,
      ),
      value: touchedValue,
      onChanged: onChangeDrop,
    );
  }
}
