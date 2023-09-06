import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Obx(() => Form(
          key: controller.registerFormKey,
          // autovalidateMode: AutovalidateMode.always,
          child: Scaffold(
              body: SizedBox(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset(IconsRental.logobiru),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Buat akun anda",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "Silahkan isi akun anda",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        autofocus: false,
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          return controller.validateEmail(value!);
                        },
                        style: const TextStyle(
                          fontSize: 12,
                          color: ColorsRentals.cTextGrey,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail_sharp),
                          prefixIconColor: ColorsRentals.cTextGrey,
                          border: InputBorder.none,
                          hintText: 'Email',
                          filled: true,
                          fillColor: ColorsRentals.cTextForm,
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsRentals.cTextForm),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsRentals.cTextForm),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        autofocus: false,
                        controller: controller.passwordController,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                        obscureText: controller.isObscurePassword.value,
                        style: const TextStyle(
                          fontSize: 12,
                          color: ColorsRentals.cTextGrey,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Kata Sandi',
                          prefixIcon: const Icon(Icons.lock),
                          prefixIconColor: ColorsRentals.cTextGrey,
                          suffixIcon: InkWell(
                              onTap: () {
                                controller.setState();
                              },
                              child: Icon(controller.isObscurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          suffixIconColor: ColorsRentals.cTextGrey,
                          filled: true,
                          fillColor: ColorsRentals.cTextForm,
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsRentals.cTextForm),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsRentals.cTextForm),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        autofocus: false,
                        controller: controller.password2Controller,
                        onSaved: (value) {
                          controller.password2 = value!;
                        },
                        validator: (value) {
                          return controller.validatePassword2(value!);
                        },
                        obscureText: controller.isObscurePassword2.value,
                        style: const TextStyle(
                          fontSize: 12,
                          color: ColorsRentals.cTextGrey,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Konfirmasi Kata Sandi',
                          prefixIcon: const Icon(Icons.lock),
                          prefixIconColor: ColorsRentals.cTextGrey,
                          suffixIcon: InkWell(
                              onTap: () {
                                controller.setState2();
                              },
                              child: Icon(controller.isObscurePassword2.value
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          suffixIconColor: ColorsRentals.cTextGrey,
                          filled: true,
                          fillColor: ColorsRentals.cTextForm,
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsRentals.cTextForm),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorsRentals.cTextForm),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: 340,
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  ColorsRentals.cPrimary),
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () {
                            controller.klikSelanjutnya(
                                controller.emailController.text,
                                controller.passwordController.text);
                            FocusScope.of(context).unfocus();
                            // controller.checkLogin();
                          },
                          child: const Text("Selanjutnya"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Sudah punya akun? ',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <InlineSpan>[
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                'Masuk sekarang',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: ColorsRentals.cPrimary),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )),
        ));
  }
}
