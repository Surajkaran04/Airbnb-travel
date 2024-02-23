import 'dart:ffi';

import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/infrastructure/utils/snackbar.util.dart';
import 'package:appentus_dummy/presentation/verify/verify_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class VerifyPage extends BaseView<VerifyController> {
  VerifyPage({super.key});


  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        "assets/images/img_back_btn.png",
                        width: 35.0,
                        height: 35.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Verfication".tr,
                      style: boldTextStyle(
                          fontSize: dimen24, color: ColorsTheme.colBlack),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "In order to complete the verification process,\n",
                            style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                          ),
                          const WidgetSpan(
                            child: SizedBox(height: 30), // Add spacing between text spans
                          ),
                          TextSpan(
                            text: "we will send you an OTP code on your phone\nnumber",
                            style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                          ),
                          const WidgetSpan(
                            child: SizedBox(height: 30), // Add spacing between text spans
                          ),
                          TextSpan(
                            text: " ${controller.textFieldType.value}".tr,
                            style: boldTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 70.0,
                    ),
                    Container(
                      width: Get.width/1.5,
                      child: Pinput(
                        closeKeyboardWhenCompleted: true,
                        length: 6,
                        pinAnimationType: PinAnimationType.slide,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        validator: (s) {
                          return s == '111111' ? null : 'Pin is incorrect';
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => controller.otp = pin,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Resend Code".tr,
                      style: boldTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),),
                    const SizedBox(
                      height: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 40.0),
                      child: GestureDetector(
                        onTap: (){
                          controller.otp == "111111" ? checkRedirect() :
                          SnackBarUtil.showError(message: "Invalid otp");
                        },
                        child: Container(
                          width: Get.width,
                          height: 64.0,
                          decoration: controller.otp == "111111" ? const BoxDecoration(
                            color: Color(0xff2454FF),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ) : const BoxDecoration(
                            color: Color(0xff9CA6CC),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Center(child: Text("Verify".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }


  final defaultPinTheme = PinTheme(
    textStyle: mediumTextStyle(fontSize: dimen14, color: Colors.black),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 1.0, color: ColorsTheme.colSecondary)),
    ),
  );

  final focusedPinTheme = PinTheme(
    textStyle: mediumTextStyle(fontSize: dimen14, color: Colors.black),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(width: 1.0, color: Colors.black)),
    ),
  );

  final submittedPinTheme = PinTheme(
    textStyle: mediumTextStyle(fontSize: dimen14, color: Colors.black),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(width: 1.0, color: Colors.black)),
    ),
  );

  checkRedirect(){
    print(controller.isViaEmail.value);
    print(controller.textFieldType.value);
    if(controller.resetType.value == "password"){
      Get.toNamed(Routes.changePassword);
    } else if (controller.resetType.value == "username"){
      Get.toNamed(Routes.emailSent, arguments: [controller.isViaEmail.value, controller.textFieldType.value, controller.resetType.value]);
    } else { Get.toNamed(Routes.login); }
  }
}
