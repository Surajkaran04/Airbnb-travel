import 'package:appentus_dummy/presentation/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileBnding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }

}