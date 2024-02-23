import 'dart:convert';

import 'package:appentus_dummy/infrastructure/app_exception/custom_http_exception.dart';
import 'package:appentus_dummy/infrastructure/model/api_response_model.dart';
import 'package:appentus_dummy/infrastructure/model/user_model.dart';
import 'package:appentus_dummy/infrastructure/network/dio_client.dart';
import 'package:appentus_dummy/infrastructure/utils/progress_dialog.dart';
import 'package:appentus_dummy/infrastructure/utils/snackbar.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  var isFill = false.obs;
  var emailAddress = TextEditingController();
  var password = TextEditingController();
  var isPassVisible = false.obs;

  checkFillOrNot() {
    if (emailAddress.text.trim().isNotEmpty && password.text.trim().isNotEmpty) {
      isFill.value = true;
    } else {
      isFill.value = false;
    }
  }

  loginApi() async {
    var progressLoader = ProgressDialog();
    progressLoader.show();

    var params = {
      "email" : emailAddress.text,
      "password" : password.text,
      "deviceType" : getDeviceType(),
      "deviceToken" : ""
    };

    var jsonEncodedParams = jsonEncode(params);

    try{
      var response = await DioClient.base().funPostApi(apiEndPoints: "signin", params: jsonEncodedParams);
      ApiResponseModel<UserModel> userModel =ApiResponseModel.fromJson(response, (data) => UserModel.fromJson(data));
      if(userModel.success!){
        progressLoader.dismiss();
        print("success");
      } else {
        progressLoader.dismiss();
        SnackBarUtil.showError(message: userModel.message!);
      }
    } on CustomHttpException catch (excaption){
      progressLoader.dismiss();
      SnackBarUtil.showError(message: excaption.message!);
    } catch (e){
      progressLoader.dismiss();
      SnackBarUtil.showError(message: 'something_went_wrong'.tr);
    }
  }

  static getDeviceType() {
    if (GetPlatform.isAndroid) {
      return 'android';
    } else if (GetPlatform.isIOS) {
      return 'ios';
    } else {
      return 'unknown';
    }
  }
}