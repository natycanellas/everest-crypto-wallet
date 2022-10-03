import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/apiCoingecko/endPoint/endPoint_provider.dart';
import '../repository/chart_info_repo.dart';
import '../useCase/get_chart_info_usecase.dart';
import '../models/chart_info_model.dart';

final getChartInfoRepoProvider = StateProvider(
  (ref) => ChartInfoRepo(
    endpoint: ref.watch(cryptosEndPointProvider),
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
