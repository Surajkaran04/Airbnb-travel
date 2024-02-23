import 'package:appentus_dummy/presentation/document/document_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentController());
  }

}