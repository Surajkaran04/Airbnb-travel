import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseLangController extends GetxController {
  var selectedTab = 0.obs;
  var lang = "English".obs;

  checkSelectedTab(int type){
    selectedTab.value = type;
    checklang(type);
  }

  checklang(int type){
    if (type == 0){
      lang.value = "English";
    } else if (type == 1){
      lang.value = "French (Français)";
    } else if (type == 2){
      lang.value = "Spanish (Española)";
    } else {
      lang.value = "Arabic (عربي)";
    }
  }

}
