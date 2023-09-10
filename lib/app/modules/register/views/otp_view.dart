import 'package:car_rent_app/app/modules/register/controllers/register_controller.dart';
import 'package:car_rent_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';

class OtpView extends GetView {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Periksa email anda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: OtpTextField(
                  numberOfFields: 6,
                  borderColor: const Color.fromARGB(255, 56, 219, 181),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    controller.otpCode.value = code;
                  },
                  onSubmit: (String verificationCode) {
                    controller.otpCode.value = verificationCode;
                  }, // end onSubmit
                ),
              ),
              SizedBox(
                width: Get.width * 2 / 3,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          ColorsRentals.cPrimary),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    controller.submitOTP();
                  },
                  child: const Text("Submit"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                  text: 'Tidak mendapatkan kode OTP? ',
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
                          controller.uploadDataRegistrasi();
                        },
                        child: const Text(
                          'Kirim ulang',
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
            ],
          ),
        ),
      ),
    );
  }
}
