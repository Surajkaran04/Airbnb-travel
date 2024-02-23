import 'package:appentus_dummy/presentation/changePassword/changePasswordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }

}