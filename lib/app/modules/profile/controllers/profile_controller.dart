import 'package:car_rent_app/app/modules/login/controllers/login_controller.dart';
import 'package:car_rent_app/app/routes/app_pages.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  final loginC = Get.put(LoginController());
  var userData = {}.obs;
  var picName = ''.obs;
  var isEdit = false.obs;

  final profileFormKey = GlobalKey<FormState>();
  late TextEditingController fullNameController,
      emailController,
      nikController,
      phoneController,
      genderController,
      dobController;

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    nikController = TextEditingController();
    phoneController = TextEditingController();
    genderController = TextEditingController();
    dobController = TextEditingController();
    update();
  }

  @override
  void onReady() {
    super.onReady();
    userData.value = loginC.getStorage.read('user');
    fullNameController.text = userData["full_name"];
    picName.value = userData["full_name"];
    emailController.text = userData["email"];
    nikController.text = userData["nik"];
    phoneController.text = userData["phone_number"];
    genderController.text =
        userData["gender"] == "laki-laki" ? "Laki-laki" : "Perempuan";
    var dobTime = DateTime.parse(userData["birth_date"]);
    dobController.text = DateFormat('dd MMMM yyyy').format(dobTime);
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setState() {
    isEdit(!isEdit.value);
    print(isEdit.value);
  }

  kliklogout() async {
    var url = Uri.parse("${UrlApi.baseAPI}/account/logout/");
    var token = 'Token ${loginC.getStorage.read("token")}';
    // loginC.getStorage.write("token", '');
    final response = await http.post(
      url,
      headers: {'Authorization': token},
    );
    if (response.statusCode == 204) {
      loginC.getStorage.write('token', '');
      loginC.getStorage.write('user', '');
      Get.offAllNamed(Routes.LOGIN);
      print('success');
    } else {
      print(response.statusCode);
    }
  }
}
