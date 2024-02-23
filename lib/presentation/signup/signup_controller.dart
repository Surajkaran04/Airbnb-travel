import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpController extends GetxController {

  var isFill = false.obs;
  var isStep2Fill = false.obs;
  var firstName = TextEditingController();
  var middlename = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var phoneNumber = TextEditingController();
  var dob = TextEditingController();
  var emailAddress = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var isPassVisible = false.obs;
  var isConfirmPassVisible = false.obs;
  var isStep = 0.obs;
  var paymentMethod = "".obs;
  var imageUrl = ''.obs;


  checkFillOrNot() {
    if (emailAddress.text.trim().isNotEmpty && password.text.trim().isNotEmpty && confirmPassword.text.trim().isNotEmpty) {
      isFill.value = true;
    } else {
      isFill.value = false;
    }
  }

  checkStep2FillOrNot() {
    if (email.text.trim().isNotEmpty
        && firstName.text.trim().isNotEmpty
        && lastName.text.trim().isNotEmpty
        && phoneNumber.text.trim().isNotEmpty
        && dob.text.trim().isNotEmpty) {
      isStep2Fill.value = true;
    } else {
      isStep2Fill.value = false;
    }
  }

  onNext(int type){
    isStep.value += type;
  }

  onBack() {
    isStep.value = isStep.value - 1;
  }
  paymentMethodType(String type) {
    paymentMethod.value = type;
    // if (type == "creditCard"){
    //   Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,);
    // } else if (type == "mobileMoney"){
    //   Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,);
    // } else if (type == "paypal"){
    //   Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,);
    // } else if (type == "zelle"){
    //   Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,);
    // } else if (type == "orangeMoney"){
    //   Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,);
    // }
  }

  changeImage() {
      imageUrl = 'assets/images/selected_btn.png' as RxString;
  }
}
