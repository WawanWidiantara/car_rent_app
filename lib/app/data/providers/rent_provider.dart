import 'package:get/get.dart';

import '../models/rent_model.dart';

class RentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Rent.fromJson(map);
      if (map is List) return map.map((item) => Rent.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Rent?> getRent(int id) async {
    final response = await get('rent/$id');
    return response.body;
  }

  Future<Response<Rent>> postRent(Rent rent) async => await post('rent', rent);
  Future<Response> deleteRent(int id) async => await delete('rent/$id');
}
