import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';
import '../../infrastructure/utils/snackbar.util.dart';

class LoginPage extends BaseView<LoginController> {
  LoginPage({super.key});

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
                      "login".tr,
                      style: boldTextStyle(
                          fontSize: dimen24, color: ColorsTheme.colBlack),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "login_desc".tr,
                      style: regularTextStyle(
                          fontSize: dimen15, color: ColorsTheme.colBlack),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
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
                          controller.checkFillOrNot();
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "username".tr,
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
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 15.0, top: 10.0, bottom: 10.0),
                      width: MediaQuery.of(context).size.width,
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
                    const SizedBox(height: 30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("forgot".tr, style: regularTextStyle(fontSize: dimen16, color: Colors.black), ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.forgotUsername);
                          },
                            child: Text(" username".tr, style: boldTextStyle(fontSize: dimen16, color: Colors.black),)),
                        Text(" or".tr, style: regularTextStyle(fontSize: dimen16, color: Colors.black),),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.forgotPassword);
                          },
                            child: Text("${" pasword".tr}?", style: boldTextStyle(fontSize: dimen16, color: Colors.black),)),
                      ],
                    ),
                    const SizedBox(
                      height: 200.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                      child: GestureDetector(
                        onTap: () async {
                          // controller.isFill.value ? Get.offAllNamed(Routes.dashboard) : SnackBarUtil.showError(message: "Required missing field");
                          // Get.toNamed(Routes.welcomepage);
                          await controller.loginApi();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 65.0,
                          decoration: controller.isFill.value
                              ? const BoxDecoration(
                                  color: Color(0xff2454FF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                )
                              : const BoxDecoration(
                                  color: Color(0xff9CA6CC),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                          child: Center(
                              child: Text(
                            "next_step".tr,
                            style: regularTextStyle(
                                fontSize: dimen16, color: ColorsTheme.colWhite),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("dont".tr, style: regularTextStyle(fontSize: dimen16, color: Colors.black), ),
                        Text(" ${"have_an_account".tr}", style: regularTextStyle(fontSize: dimen16, color: Colors.black),),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(Routes.signup);
                          },
                            child: Text(" ${"signup".tr}", style: boldTextStyle(fontSize: dimen16, color: Colors.black),)),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }


}
