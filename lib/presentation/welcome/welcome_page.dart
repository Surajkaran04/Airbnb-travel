import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/infrastructure/navigation/routes.dart';
import 'package:appentus_dummy/presentation/welcome/wlcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/preference/preference_manager.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class WelcomePage extends BaseView<WelcomeController> {
  WelcomePage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Color(0xffEEF5FF), shape: BoxShape.rectangle,),

            child: Column(
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width,
                  // height: (PrefManager.getString("lang")=="en")?670:720,
                  decoration: const BoxDecoration(color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(145), bottomLeft: Radius.circular(145))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 30.0, right: 15.0, bottom: 15),
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
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/splash_img.png",
                                width: 90.0,
                                height: 50.0,
                              ),
                              Text("skip_now".tr, style: boldTextStyle(fontSize: dimen16, color: ColorsTheme.colBlack),)
                            ],
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            "find_your_lost_document".tr,
                            style: boldTextStyle(
                                fontSize: dimen24, color: ColorsTheme.colBlack),
                          ),
                          const SizedBox(height: 15.0,),
                          Text(
                            "lost_doucument_desc".tr,
                            style: regularTextStyle(
                                fontSize: dimen16, color: ColorsTheme.colBlack),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TweenAnimationBuilder(
                              duration: const Duration(seconds: 2),
                              tween: Tween(begin: 25.0, end: 200.0),
                              builder: (context, value, child) => Image.asset(
                                "assets/images/welcome_img.png",
                                width: MediaQuery.of(context).size.width,
                                height: 280.0,
                              ),
                          ),

                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isClickedLogin.value = true;
                          Get.toNamed(Routes.login);
                          },
                        child: Obx(() => Container(
                          width: 160.0,
                          height: 60.0,
                          decoration: controller.isClickedLogin.value ? BoxDecoration(color: const Color(0xff2454FF), border: Border.all(color: const Color(0xff2454FF), width: 1),
                              borderRadius: BorderRadius.circular(60)) : BoxDecoration(color:  Colors.transparent, border: Border.all(color: const Color(0xff2454FF), width: 1),
                              borderRadius: BorderRadius.circular(60)),
                          child: Center(child:
                          controller.isClickedLogin.value ? Text("login".tr, style: semiBoldTextStyle(fontSize: dimen16, color: Colors.white),) :
                          Text("login".tr, style: semiBoldTextStyle(fontSize: dimen16, color: const Color(0xff2454FF)),)),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.isClickedLogin.value = false;
                          Get.toNamed(Routes.signup);
                        },
                        child: Obx(() => Container(
                          width: 160.0,
                          height: 60.0,
                          decoration: controller.isClickedLogin.value ? BoxDecoration(color: Colors.transparent, border: Border.all(color: const Color(0xff2454FF), width: 1),
                              borderRadius: BorderRadius.circular(60)) : BoxDecoration(color: const Color(0xff2454FF), border: Border.all(color: const Color(0xff2454FF), width: 1),
                              borderRadius: BorderRadius.circular(60)),
                          child: Center(child:
                          controller.isClickedLogin.value ? Text("signup".tr, style: semiBoldTextStyle(fontSize: dimen16, color: const Color(0xff2454FF)),) :
                          Text("signup".tr, style: semiBoldTextStyle(fontSize: dimen16, color: Colors.white),)),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
