import 'package:appentus_dummy/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}