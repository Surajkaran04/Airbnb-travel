import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/preference/preference_manager.dart';

class WelcomeController extends GetxController{
var isClickedLogin = false.obs;

var containerHeight = (PrefManager.getString("lang") == "en" ? 670.0 : 720.0).obs;
}