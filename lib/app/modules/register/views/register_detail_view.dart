import 'dart:io';

import 'package:car_rent_app/app/modules/register/controllers/register_controller.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterDetailView extends GetView<RegisterController> {
  const RegisterDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Obx(() => Form(
        key: controller.detailRegisterFormKey,
        child: Scaffold(
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
          body: SizedBox(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Informasi Pribadi",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Silahkan isi informasi pribadi anda",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Nama Lengkap",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: controller.fullNameController,
                      validator: (value) {
                        return controller.validateName(value!);
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: ColorsRentals.cTextGrey,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        border: InputBorder.none,
                        hintText: 'Nama lengkap anda',
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
                        enabledBorder: UnderlineInputBorder(
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
                      "Jenis Kelamin",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(
                            value: "laki-laki",
                            child: Text("Laki-laki",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsRentals.cTextGrey,
                                ))),
                        DropdownMenuItem(
                            value: "erempuan",
                            child: Text("Perempuan",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsRentals.cTextGrey,
                                ))),
                      ],
                      onChanged: (newValue) {
                        controller.setSelected(newValue);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        border: InputBorder.none,
                        hintText: 'Nomor Induk Keluarga anda',
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
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorsRentals.cTextForm),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      value: controller.selectedGender.value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Tanggal lahir",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: controller.dobController,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (value) {
                        return controller.validateDOB(value!);
                      },
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller.chooseDate();
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: ColorsRentals.cTextGrey,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 25),
                          child: Icon(Icons.calendar_month),
                        ),
                        suffixIconColor: ColorsRentals.cTextGrey,
                        contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        border: InputBorder.none,
                        hintText: 'DD/MM/YYYY',
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
                        enabledBorder: UnderlineInputBorder(
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
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        return controller.validatePhone(value!);
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: ColorsRentals.cTextGrey,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        border: InputBorder.none,
                        hintText: '08 xxxx',
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
                        enabledBorder: UnderlineInputBorder(
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
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: controller.nikController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return controller.validateNIK(value!);
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: ColorsRentals.cTextGrey,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        border: InputBorder.none,
                        hintText: 'Nomor Induk Keluarga anda',
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
                        enabledBorder: UnderlineInputBorder(
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
                      "Unggah KTP",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => TextFormField(
                          autofocus: false,
                          controller: controller.ktpController,
                          validator: (value) {
                            return controller.validateKTP(value!);
                          },
                          textAlignVertical: TextAlignVertical.center,
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            controller.getImageKTP(ImageSource.camera);
                          },
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorsRentals.cTextGrey,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: controller.selectedKtp.value == ""
                                ? 'Unggah foto KTP'
                                : 'Unggah ulang',
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
                            prefixIcon: const Padding(
                              padding: EdgeInsetsDirectional.only(start: 100),
                              child: Icon(Icons.upload),
                            ),
                            prefixIconColor: ColorsRentals.cTextGrey,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => controller.selectedKtp.value == ""
                          ? Container()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(controller.selectedKtp.value),
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Unggah SIM",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => TextFormField(
                          autofocus: false,
                          textAlignVertical: TextAlignVertical.center,
                          controller: controller.simController,
                          validator: (value) {
                            return controller.validateSIM(value!);
                          },
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            controller.getImageSIM(ImageSource.camera);
                          },
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorsRentals.cTextGrey,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: controller.selectedSim.value == ""
                                ? 'Unggah foto SIM'
                                : 'Unggah ulang',
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
                            prefixIcon: const Padding(
                              padding: EdgeInsetsDirectional.only(start: 100),
                              child: Icon(Icons.upload),
                            ),
                            prefixIconColor: ColorsRentals.cTextGrey,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => controller.selectedSim.value == ""
                          ? Container()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(controller.selectedSim.value),
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    const SizedBox(height: 50),
                    controller.isLoading.value == true
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          ColorsRentals.cPrimary),
                                  shape: MaterialStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                controller.uploadDataRegistrasi();
                              },
                              child: const Text("Daftar"),
                            ),
                          ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
