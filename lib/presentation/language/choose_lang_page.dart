import 'package:appentus_dummy/infrastructure/local/app_translations.dart';
import 'package:appentus_dummy/infrastructure/preference/preference_manager.dart';
import 'package:appentus_dummy/infrastructure/theme/text.theme.dart';
import 'package:appentus_dummy/presentation/language/choose_lang-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/core/base/base_view.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors.theme.dart';

class ChooseLangPage extends BaseView<ChooseLangController> {
   ChooseLangPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Obx(() => Container(
              padding: const EdgeInsets.only(top: 70.0,right: 20.0, left: 20.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/splash_img.png", width: 90.0, height: 50.0,),
                  const SizedBox(height: 30.0,),
                  Image.asset("assets/images/path_4.png", width: 60.0, height: 60.0,),
                  const SizedBox(height: 30.0,),
                  Text("choose_your_language".tr, style: boldTextStyle(fontSize: dimen16, color: ColorsTheme.colBlack),),
                  const SizedBox(height: 30.0,),
                  GestureDetector(
                    onTap: (){
                      controller.checkSelectedTab(0);
                      AppTranslations().changeLocale("en");
                      PrefManager.putString("lang", "en");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70.0,
                      decoration: controller.selectedTab.value == 0 ?const BoxDecoration(
                        color: Color(0xff2454FF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ):
                      const BoxDecoration(
                        color: Color(0xffEEF5FF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      // margin: EdgeInsets.only(left: 15.0),
                      // Text("English"),

                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: controller.selectedTab.value == 0 ? ColorsTheme.colWhite : const Color(0xff2454FF),
                                  child: controller.selectedTab.value == 0 ? Text("EN", style: boldTextStyle(fontSize: dimen16, color: const Color(0xff2454FF)),) : Text("EN", style: boldTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),),
                                ),
                                // margin: EdgeInsets.only(left: 15.0),
                                const SizedBox(width: 20.0,),
                                controller.selectedTab.value == 0 ? Text("English", style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),) : Text("English", style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colBlack),),
                                const SizedBox(width: 20.0,),
                              ],
                            ),
                            Visibility(
                                visible: controller.selectedTab.value == 0,
                                child: Image.asset("assets/images/right_tik.png", width: 20.0, height: 12.0,)
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  GestureDetector(
                    onTap: (){
                      controller.checkSelectedTab(1);
                      AppTranslations().changeLocale("fr");
                      PrefManager.putString("lang", "fr");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70.0,
                      decoration: controller.selectedTab.value == 1 ? const BoxDecoration(
                        color: Color(0xff2454FF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ) :  const BoxDecoration(
                        color: Color(0xffEEF5FF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: controller.selectedTab.value == 1 ? ColorsTheme.colWhite : const Color(0xff2454FF) ,
                                  child: Text("FR", style: boldTextStyle(fontSize: dimen16, color: controller.selectedTab.value == 1 ? const Color(0xff2454FF) : ColorsTheme.colWhite),),
                                ),
                                // margin: EdgeInsets.only(left: 15.0),
                                const SizedBox(width: 20.0,),
                                Text("French (Français)", style: regularTextStyle(fontSize: dimen16, color: controller.selectedTab.value == 1 ? ColorsTheme.colWhite : ColorsTheme.colBlack)),
                                const SizedBox(width: 20.0,),
                              ],
                            ),
                            Visibility(
                                visible: controller.selectedTab.value == 1,
                                child: Image.asset("assets/images/right_tik.png", width: 20.0, height: 12.0,)
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  GestureDetector(
                    onTap: (){
                      controller.checkSelectedTab(2);
                      AppTranslations().changeLocale("es");
                      PrefManager.putString("lang", "es");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70.0,
                      decoration: controller.selectedTab.value == 2 ? const BoxDecoration(
                        color: Color(0xff2454FF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ) :  const BoxDecoration(
                        color: Color(0xffEEF5FF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: controller.selectedTab.value == 2 ? ColorsTheme.colWhite : const Color(0xff2454FF),
                                  child: Text("ES", style: boldTextStyle(fontSize: dimen16, color: controller.selectedTab.value == 2 ? const Color(0xff2454FF) : ColorsTheme.colWhite),),
                                ),
                                SizedBox(width: 20.0,),
                                Text("Spanish (Española)", style: regularTextStyle(fontSize: dimen16, color: controller.selectedTab.value == 2 ? ColorsTheme.colWhite : ColorsTheme.colBlack)),
                                SizedBox(width: 20.0,),
                              ],
                            ),
                            Visibility(
                                visible: controller.selectedTab.value == 2,
                                child: Image.asset("assets/images/right_tik.png", width: 20.0, height: 12.0,)
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  GestureDetector(
                    onTap: (){
                      controller.checkSelectedTab(3);
                      AppTranslations().changeLocale("ar");
                      PrefManager.putString("lang", "ar");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70.0,
                      decoration: controller.selectedTab.value == 3 ? const BoxDecoration(
                        color: Color(0xff2454FF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ) :  const BoxDecoration(
                        color: Color(0xffEEF5FF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: controller.selectedTab.value == 3 ? ColorsTheme.colWhite : const Color(0xff2454FF),
                                  child: Text("AR", style: boldTextStyle(fontSize: dimen16, color: controller.selectedTab.value == 3 ? const Color(0xff2454FF) : ColorsTheme.colWhite),),
                                ),
                                SizedBox(width: 20.0,),
                                Text("Arabic (عربي)", style: regularTextStyle(fontSize: dimen16, color: controller.selectedTab.value == 3 ? ColorsTheme.colWhite : ColorsTheme.colBlack)),
                                SizedBox(width: 20.0,),
                              ],
                            ),
                            Visibility(
                                visible: controller.selectedTab.value == 3,
                                child: Image.asset("assets/images/right_tik.png", width: 20.0, height: 12.0,)
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),

                  const SizedBox(height: 40.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0,right: 40.0),
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.welcomepage);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 65.0,
                        decoration: const BoxDecoration(
                          color: Color(0xff2454FF),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Center(child: Text("continue_with".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
