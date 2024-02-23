import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {

  var isViaEmail = false.obs;
  var phoneNumber = TextEditingController();
  var emailAddress = TextEditingController();
  var phoneNumberText = "".obs;
  var emailText = "".obs;
  var isFill = false.obs;
  var reset = "".obs;

  checkFillOrNot() {
    if (emailAddress.text.trim().isNotEmpty || phoneNumber.text.trim().isNotEmpty) {
      isFill.value = true;
    } else {
      isFill.value = false;
    }
  }
}