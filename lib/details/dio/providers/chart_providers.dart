import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_first_task/details/dio/endPoint/crypto_chart_endpoint.dart';
import 'package:warren_first_task/details/dio/repository/chart_info_repo.dart';
import 'package:warren_first_task/details/dio/useCase/get_chart_info_usecase.dart';
import 'package:warren_first_task/shared/providers/provider.dart';

import '../useCase/models/chart_info_model.dart';

final getChartInfoEndpointProvider = StateProvider(
  (ref) => CryptoChartEndpoint(
    dio: ref.watch(dioProvider),
  ),
);

final getChartInfoRepoProvider = StateProvider(
  (ref) => ChartInfoRepo(
    endpoint: ref.watch(getChartInfoEndpointProvider),
  ),
);

final getChartInfoUseCaseProvider = StateProvider(
  (ref) => GetChartInfoUsecase(
    repo: ref.watch(getChartInfoRepoProvider),
  ),
);

final getChartInfoProvider = FutureProvider.family<ChartInfoModel, String>(
  (ref, id) => ref.watch(getChartInfoUseCaseProvider).getInfo(id),
);
