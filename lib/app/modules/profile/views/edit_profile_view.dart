import 'package:car_rent_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import 'package:get/get.dart';

class EditProfileView extends GetView {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Obx(() => ProfilePicture(
                        name: controller.picName.value,
                        radius: 31,
                        fontsize: 21,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // InkWell(
              //   onTap: () {
              //     Get.to(EditProfileView());
              //   },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Icon(
              //         Icons.edit,
              //         size: 15,
              //         color: ColorsRentals.cPrimary,
              //       ),
              //       SizedBox(width: 5),
              //       const Text(
              //         "Edit",
              //         style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w500,
              //           color: ColorsRentals.cPrimary,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const Text(
                "Nama",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                autofocus: false,
                controller: controller.fullNameController,
                onSaved: (value) {
                  // controller.fullName = value!;
                },
                validator: (value) {
                  // return controller.validateEmail(value!);
                },
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ColorsRentals.cTextForm,
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                autofocus: false,
                controller: controller.emailController,
                onSaved: (value) {
                  // controller.fullName = value!;
                },
                validator: (value) {
                  // return controller.validateEmail(value!);
                },
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ColorsRentals.cTextForm,
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "NIK",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                autofocus: false,
                controller: controller.nikController,
                onSaved: (value) {
                  // controller.fullName = value!;
                },
                validator: (value) {
                  // return controller.validateEmail(value!);
                },
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ColorsRentals.cTextForm,
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Nomor telepon",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                autofocus: false,
                controller: controller.phoneController,
                onSaved: (value) {
                  // controller.fullName = value!;
                },
                validator: (value) {
                  // return controller.validateEmail(value!);
                },
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ColorsRentals.cTextForm,
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Jenis kelamin",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                autofocus: false,
                controller: controller.genderController,
                onSaved: (value) {
                  // controller.fullName = value!;
                },
                validator: (value) {
                  // return controller.validateEmail(value!);
                },
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ColorsRentals.cTextForm,
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Tanggal lahir",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                autofocus: false,
                controller: controller.dobController,
                onSaved: (value) {
                  // controller.fullName = value!;
                },
                validator: (value) {
                  // return controller.validateEmail(value!);
                },
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ColorsRentals.cTextForm,
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ColorsRentals.cTextForm),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          ColorsRentals.cPrimary),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    // controller.kliklogout();
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //             style: ButtonStyle(
              //                 backgroundColor: const MaterialStatePropertyAll(
              //                     ColorsRentals.cPrimary),
              //                 shape: MaterialStatePropertyAll<
              //                         RoundedRectangleBorder>(
              //                     RoundedRectangleBorder(
              //                         borderRadius:
              //                             BorderRadius.circular(10)))),
              //             onPressed: () {
              //               controller.kliklogin(
              //                   controller.emailController.text,
              //                   controller.passwordController.text);
              //               FocusScope.of(context).unfocus();
              //               // controller.checkLogin();
              //             },
              //             child: const Text("Masuk"),
              //           ),
            ],
          ),
        ),
      ),
    );
  }
}
