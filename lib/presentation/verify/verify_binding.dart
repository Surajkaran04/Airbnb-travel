import 'package:appentus_dummy/presentation/verify/verify_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyController());
  }

}