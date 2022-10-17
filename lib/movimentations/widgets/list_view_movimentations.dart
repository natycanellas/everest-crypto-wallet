import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:warren_first_task/l10n/app_localizations.dart';

import '../../shared/assets/images.dart';
import '../../shared/styles/colors.dart';
import '../providers/movimentations_provider.dart';
import 'list_tile_movimentation.dart';

class ListViewMovimentations extends HookConsumerWidget {
  const ListViewMovimentations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movimentationsList = ref.watch(movimentationsListProvider.state);

    return Visibility(
      visible: movimentationsList.state.isNotEmpty,
      replacement: Center(
          child: Column(
        children: [
          Lottie.asset(lottieNoData),
          Text(
            AppLocalizations.of(context)!.noMovimentations,
            style: const TextStyle(
              fontSize: 19,
              color: lightColor,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      )),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: movimentationsList.state.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Divider(
                    thickness: 1.3,
                    height: 1.8,
                  ),
                ),
                ListTileMovimentation(
                  movimentation: movimentationsList.state[index],
                ),
              ],
            );
          }),
    );
  }
}
