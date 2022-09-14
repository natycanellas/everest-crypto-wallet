import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/colors.dart';
import '../providers/providers.dart';

class TitleRow extends StatefulHookConsumerWidget {
  const TitleRow({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TitleRow> createState() => _TitleRowState();
}

class _TitleRowState extends ConsumerState<TitleRow> {
  @override
  Widget build(BuildContext context) {
    var isVisibleState = ref.watch(visibleProvider.state);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Cripto',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: titleMagenta,
            ),
          ),
          IconButton(
            icon: Icon(
              isVisibleState.state ? Icons.visibility : Icons.visibility_off,
              size: 22,
            ),
            onPressed: () {
              isVisibleState.state = !isVisibleState.state;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}