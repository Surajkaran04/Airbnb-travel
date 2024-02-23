import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
var number = "+233-123456790".obs;
var isFill = false.obs;
var otp = "";
var isViaEmail = false.obs;
var textFieldType = "".obs;
var resetType = "".obs;

@override
  void onInit() {
  isViaEmail.value = Get.arguments[0] ?? false;
  textFieldType.value = Get.arguments[1] ?? "";
  resetType.value = Get.arguments[2] ?? "";
  super.onInit();
  }

}