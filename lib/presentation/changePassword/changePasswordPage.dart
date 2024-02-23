import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/infrastructure/utils/snackbar.util.dart';
import 'package:appentus_dummy/presentation/forgotUsername/forgot_username_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';
import 'changePasswordController.dart';

class ChangePasswordPage extends BaseView<ChangePasswordController> {
  ChangePasswordPage({super.key});

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
                      Visibility(
                        visible: false,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            "assets/images/img_back_btn.png",
                            width: 35.0,
                            height: 35.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Change Password".tr,
                        style: boldTextStyle(
                            fontSize: dimen24, color: ColorsTheme.colBlack),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Enter your new password".tr,
                        style: regularTextStyle(
                            fontSize: dimen15, color: ColorsTheme.colBlack),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 15.0, top: 10.0, bottom: 10.0),
                        width: Get.width,
                        height: 68.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.blueGrey.shade200,
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            Expanded(
                                child: Obx(() => TextField(
                                  controller: controller.password,
                                  obscureText:
                                  !controller.isPassVisible.value,
                                  onChanged: (text) {
                                    controller.checkFillOrNot();
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "password".tr,
                                    hintStyle: regularTextStyle(
                                        fontSize: dimen15,
                                        color: const Color(0xff9CA6CC)),
                                    border: InputBorder.none,
                                  ),
                                  style: regularTextStyle(
                                      fontSize: dimen15, color: Colors.black),
                                ))),
                            InkWell(
                              onTap: () {
                                controller.isPassVisible.value =
                                !controller.isPassVisible.value;
                              },
                              child: Obx(
                                    () => Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Icon(
                                    controller.isPassVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off_outlined,
                                    size: 25,
                                    color: ColorsTheme.col252525,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 15.0, top: 10.0, bottom: 10.0),
                        width: Get.width,
                        height: 68.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.blueGrey.shade200, width: 1,),
                            borderRadius: const BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Obx(() => TextField(
                                controller: controller.confirmPassword,
                                obscureText: !controller.isConfirmPassVisible.value,
                                onChanged: (text) {
                                  controller.checkFillOrNot();
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "confirm_password".tr,
                                  hintStyle: regularTextStyle(
                                      fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                  border: InputBorder.none,
                                  // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
                                ),
                                style: regularTextStyle(fontSize: dimen15, color: Colors.black),
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                controller.isConfirmPassVisible.value = !controller.isConfirmPassVisible.value;
                              },
                              child: Obx(
                                    () => Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Icon(
                                    controller.isConfirmPassVisible.value ? Icons.visibility : Icons.visibility_off_outlined,
                                    size: 25,
                                    color: ColorsTheme.col252525,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "The password must be at least 8 characters long and contain characters from alphabets, numbers, and special symbols.".tr,
                        style: regularTextStyle(
                            fontSize: dimen15, color: ColorsTheme.colBlack),
                      ),
                      const SizedBox(
                        height: 70.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0,right: 40.0),
                        child: GestureDetector(
                          onTap: (){
                            Get.offAllNamed(Routes.login);
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
                            child: Center(child: Text("Change Password".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
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
}
