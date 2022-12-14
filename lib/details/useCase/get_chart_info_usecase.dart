import '../../shared/apiCoingecko/response/chartInfo/chart_info_mapper.dart';
import '../../shared/apiCoingecko/response/chartInfo/chart_info_response.dart';
import '../models/chart_info_model.dart';
import '../repository/chart_info_repo.dart';

class GetChartInfoUsecase {
    final ChartInfoRepo repo;
  GetChartInfoUsecase({
    required this.repo,
  });
  Future<ChartInfoModel> getInfo(String id) async {
    ChartInfoResponse response = await repo.getChartInfoList(id);
    return response.toSeeData();
  }
}
