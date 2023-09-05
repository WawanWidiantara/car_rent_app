import 'package:get/get.dart';

import '../models/cars_detail_model.dart';

class CarsDetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      // if (map is Map<String, dynamic>) return CarsDetail.fromJson(map);
      if (map is List)
        return map.map((item) => CarsDetail.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<CarsDetail?> getCarsDetail(int id) async {
    final response = await get('carsdetail/$id');
    return response.body;
  }

  Future<Response<CarsDetail>> postCarsDetail(CarsDetail carsdetail) async =>
      await post('carsdetail', carsdetail);
  Future<Response> deleteCarsDetail(int id) async =>
      await delete('carsdetail/$id');
}
