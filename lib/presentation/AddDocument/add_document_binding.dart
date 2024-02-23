import 'package:appentus_dummy/presentation/AddDocument/add_document_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDocumentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddDocumentController());
  }

}