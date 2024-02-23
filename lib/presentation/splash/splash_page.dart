import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/presentation/splash/splash_controller.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class SplashPage extends BaseView<SplashController> {
   SplashPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(child: Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        tween: Tween(begin: 25.0, end: 200.0),
        builder: (context, value, child) => Image.asset(controller.appLogo.value, width: value, height: value,)
      ),
    ));
  }
}
