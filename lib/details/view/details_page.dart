import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/arguments.dart';
import '../../shared/models/crypto_model.dart';
import '../../shared/providers/provider_shared.dart';
import '../widgets/app_bar_details.dart';
import '../widgets/body_details.dart';

class DetailsPage extends HookConsumerWidget {
  static const route = '/details-page';

  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    CryptoModel crypto = args.cryptoModel!;
    ref.read(cryptoCoinProvider.notifier).state = crypto;

    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarDetails(),
      body: BodyDetails(),
    );
  }
}

