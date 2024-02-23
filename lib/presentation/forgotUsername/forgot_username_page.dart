import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/infrastructure/utils/snackbar.util.dart';
import 'package:appentus_dummy/presentation/forgotUsername/forgot_username_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class ForgotUsernamePage extends BaseView<ForgotUsernameController>{
  ForgotUsernamePage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(() => Container(
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
                      "Forgot Username".tr,
                      style: boldTextStyle(
                          fontSize: dimen24, color: ColorsTheme.colBlack),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Visibility(
                      visible: controller.isViaEmail.value ? false : true,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "You can find your username by entering your\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "email address registered and we will send an\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "email to your username.".tr,
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.isViaEmail.value ? true : false,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "You can find your username by entering your\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "Phone Number registered and we will send an\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "message to your username.".tr,
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Visibility(
                      visible: controller.isViaEmail.value ? false : true,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width,
                        height: 68.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey.shade200,
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        child: TextField(
                          controller: controller.emailAddress,
                          onChanged: (text) {
                            controller.emailText.value = text;
                            controller.checkFillOrNot();
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Email Address".tr,
                            // labelText: "username".tr,
                            // labelStyle: const TextStyle(
                            //   color: Colors.grey,
                            // ),
                            hintStyle: regularTextStyle(
                                fontSize: dimen15, color: const Color(0xff9CA6CC)),
                            border: InputBorder.none,
                          ),
                          style: regularTextStyle(
                              fontSize: dimen15, color: Colors.black),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.isViaEmail.value ? true : false,
                        child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        controller.checkFillOrNot();
                        controller.phoneNumberText.value = number.phoneNumber.toString();
                      },
                      onInputValidated: (bool value) {
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: PhoneNumber(isoCode: 'US'),
                      textFieldController: controller.phoneNumber,
                      inputDecoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Phone Number".tr,
                        hintStyle: regularTextStyle(fontSize: dimen15, color: const Color(0xff9CA6CC)),
                        border: InputBorder.none,
                      ),
                      textStyle: regularTextStyle(fontSize: dimen16, color: Colors.black),
                    )),
                    const SizedBox(
                      height: 20.0,
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("forgot Username via".tr, style: regularTextStyle(fontSize: dimen16, color: Colors.black), ),
                        Visibility(
                              visible: controller.isViaEmail.value ? true : false,
                              child: GestureDetector(
                                  onTap: () {
                                    controller.phoneNumber.text = "";
                                    controller.isFill.value = false;
                                    controller.isViaEmail.value = false;
                                  },
                                  child: Text(" Email Address".tr, style: boldTextStyle(fontSize: dimen16, color: Colors.black),)),
                            ),
                        Visibility(
                            visible: controller.isViaEmail.value ? false : true,
                            child: GestureDetector(
                                onTap: () {
                                  controller.emailAddress.text = "";
                                  controller.isFill.value = false;
                                  controller.isViaEmail.value = true;
                                },
                                child: Text(" Phone Number".tr, style: boldTextStyle(fontSize: dimen16, color: Colors.black),)),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 70.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 40.0),
                      child: GestureDetector(
                        onTap: (){
                          controller.reset.value = "username";
                          controller.isFill.value ? (controller.isViaEmail.value ? Get.toNamed(Routes.verify, arguments: [controller.isViaEmail.value, controller.phoneNumberText.value, controller.reset.value])
                              : Get.toNamed(Routes.emailSent, arguments: [controller.isViaEmail.value, controller.emailText.value])) : SnackBarUtil.showError(message: "Required missing field.");
                        },
                        child: Container(
                          width: Get.width,
                          height: 64.0,
                          decoration: controller.isFill.value ? const BoxDecoration(
                            color: Color(0xff2454FF),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ) : const BoxDecoration(
                            color: Color(0xff9CA6CC),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Center(child: Text("Send".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                        ),
                      ),
                    ),
                  ]),
            )),
          ),
        ),
      ),
    );
  }

}