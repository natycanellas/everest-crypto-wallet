import 'package:warren_first_task/details/dio/response/chart_info_response.dart';
import 'package:warren_first_task/details/dio/useCase/models/chart_info_model.dart';

extension ChartInfoMapper on ChartInfoResponse {
  ChartInfoModel toSeeData() {
    List<List<num>> info = [];
    for (int i = 0; i < prices.length; i++) {
      info.add([prices[i][0],
      prices[90 - i][1],]);
    }
    return ChartInfoModel(prices: info);
  }
}