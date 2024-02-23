import 'package:appentus_dummy/presentation/language/choose_lang_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/constants/app_constants.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/preference/preference_manager.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin{
  AnimationController? rotationController;
  late AnimationController animationController;
  late AnimationController rotationControllerText;
  late Animation<double> animation = 0.obs as Animation<double>;
  late Tween<double> tweenSize = 0.obs as Tween<double>;
  late Animation<Offset> animationOffset;
  late Animation<AlignmentGeometry?> align;
  late Animation sizeAnimation;
  var appLogo = "".obs;

  @override
  void onInit() {
    appLogo.value = "assets/images/app_icon.png";
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    tweenSize = Tween(begin: 0, end: 200);
    animation = tweenSize.animate(animationController);
    animationController.forward();
    print("start");
    Future.delayed(const Duration(milliseconds: 2200), () async {
      // var isLoggedIn = await PrefManager.getBool(AppConstants.isLoggedIn);
      // !isLoggedIn ? Get.offNamed(Routes.login) : Get.offNamed(Routes.chooselanguage);
      Get.offNamed(Routes.chooselanguage);

      print("started here");
      // Get.off(ChooseLangPage());
    });
    super.onInit();
  }

}