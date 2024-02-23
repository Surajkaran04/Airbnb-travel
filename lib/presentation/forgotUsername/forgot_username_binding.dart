import 'package:appentus_dummy/presentation/forgotUsername/forgot_username_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotUsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotUsernameController());
  }

}