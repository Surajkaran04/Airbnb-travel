import 'package:appentus_dummy/presentation/welcome/wlcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }

}