import 'dart:convert';

import 'package:car_rent_app/app/data/models/cars_model.dart';
import 'package:car_rent_app/app/modules/login/controllers/login_controller.dart';
import 'package:car_rent_app/constans.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BerandaController extends GetxController {
  final loginC = Get.put(LoginController());
  var user = "".obs;
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  var carsList = <Cars>[].obs;

  @override
  void onInit() {
    super.onInit();
    update();
  }

  @override
  void onReady() {
    super.onReady();
    final userData = loginC.getStorage.read('user');
    user.value = userData['full_name'];
    fetchCarsData();
    update();
  }

  @override
  void onClose() {
    Get.delete<BerandaController>();
    super.onClose();
  }

  Future fetchCarsData() async {
    isLoading(false);
    try {
      var url = Uri.parse(
          "${UrlApi.baseAPI}/api/cars/?is_booked=False&&fields=id,name,price,picture");

      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      final jsonItems = result['data'].cast<Map<String, dynamic>>();
      carsList.value = jsonItems.map<Cars>((json) {
        return Cars.fromJson(json);
      }).toList();
      update(carsList);
      isLoading(false);
      isError(false);
      update();
      return carsList;
    } catch (e) {
      isLoading(false);
      isError(true);
      errmsg(e.toString());
      throw Exception(e);
    }
  }
}
