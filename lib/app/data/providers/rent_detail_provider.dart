import 'package:get/get.dart';

import '../models/rent_detail_model.dart';

class RentDetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return RentDetail.fromJson(map);
      if (map is List)
        return map.map((item) => RentDetail.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<RentDetail?> getRentDetail(int id) async {
    final response = await get('rentdetail/$id');
    return response.body;
  }

  Future<Response<RentDetail>> postRentDetail(RentDetail rentdetail) async =>
      await post('rentdetail', rentdetail);
  Future<Response> deleteRentDetail(int id) async =>
      await delete('rentdetail/$id');
}
