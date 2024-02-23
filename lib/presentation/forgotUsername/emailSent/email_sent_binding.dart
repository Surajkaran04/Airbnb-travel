import 'package:appentus_dummy/presentation/forgotUsername/emailSent/email_sent_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailSentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailSentController());
  }

}