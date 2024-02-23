import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{

  var isFill = false.obs;
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var isPassVisible = false.obs;
  var isConfirmPassVisible = false.obs;

  checkFillOrNot() {
    if (password.text.trim().isNotEmpty && confirmPassword.text.trim().isNotEmpty) {
      isFill.value = true;
    } else {
      isFill.value = false;
    }
  }
}