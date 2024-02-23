import 'package:appentus_dummy/presentation/language/choose_lang-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseLangBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseLangController());
  }

}