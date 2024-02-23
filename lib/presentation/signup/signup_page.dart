

import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/infrastructure/navigation/routes.dart';
import 'package:appentus_dummy/presentation/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';
import 'package:flutter/services.dart';

import '../../infrastructure/utils/snackbar.util.dart';


class SignUpPage extends BaseView<SignUpController> {
  SignUpPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
            slivers: [
              SliverList(delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: common(),
                  )
                ]
              ))
            ],
          ),
      ),
    );
  }

  common() {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        GestureDetector(
          onTap: () {
            // Obx(()=>(controller.isStep.value == 0) ? Get.back() : step2());
            // controller.onBack();
           (controller.isStep.value == 0 ? Get.back() : controller.onBack());
          },
          child: Image.asset(
            "assets/images/img_back_btn.png",
            width: 35.0,
            height: 35.0,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "signup".tr,
          style: boldTextStyle(fontSize: dimen24, color: ColorsTheme.colBlack),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "signup_desc".tr,
          style:
              regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
        ),
        const SizedBox(height: 20.0,),
        Obx(() {
            if (controller.isStep.value == 0) {
              return step1();
            } else if (controller.isStep.value == 1) {
              return step2();
            } else {
              return step3();
            }
          },
        )
      ]),
    );
  }

  step1() {
    return Container(
      // width: Get.width,
      // height: Get.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("username_and_password".tr, style: boldTextStyle(fontSize: dimen16, color: ColorsTheme.colBlack),),
              Text("step1/3".tr, style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),)
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: Get.width,
            height: 68.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  width: 1,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(20))),
            child: TextField(
              controller: controller.emailAddress,
              onChanged: (text) {
                controller.checkFillOrNot();
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "username".tr,
                hintStyle: regularTextStyle(fontSize: dimen15, color: const Color(0xff9CA6CC)),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
              ),
              style: regularTextStyle(fontSize: dimen15, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 15.0, top: 10.0, bottom: 10.0),
            width: Get.width,
            height: 68.0,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.blueGrey.shade200, width: 1,),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                Expanded(
                    child: Obx(() => TextField(
                      controller: controller.password,
                      obscureText: !controller.isPassVisible.value,
                      onChanged: (text) {
                        controller.checkFillOrNot();
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "password".tr,
                        hintStyle: regularTextStyle(
                            fontSize: dimen15,
                            color: const Color(0xff9CA6CC)),
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
                      ),
                      style: regularTextStyle(
                          fontSize: dimen15, color: Colors.black),
                    ))),
                InkWell(
                  onTap: () {
                    controller.isPassVisible.value = !controller.isPassVisible.value;
                  },
                  child: Obx(
                        () => Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Icon(
                        controller.isPassVisible.value ? Icons.visibility : Icons.visibility_off_outlined,
                        size: 25,
                        color: ColorsTheme.col252525,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 15.0, top: 10.0, bottom: 10.0),
            width: Get.width,
            height: 68.0,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.blueGrey.shade200, width: 1,),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                Expanded(
                  child: Obx(() => TextField(
                    controller: controller.confirmPassword,
                    obscureText: !controller.isConfirmPassVisible.value,
                    onChanged: (text) {
                      controller.checkFillOrNot();
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "confirm_password".tr,
                      hintStyle: regularTextStyle(
                          fontSize: dimen15, color: const Color(0xff9CA6CC)),
                      border: InputBorder.none,
                      // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
                    ),
                    style: regularTextStyle(fontSize: dimen15, color: Colors.black),
                  )),
                ),
                InkWell(
                  onTap: () {
                    controller.isConfirmPassVisible.value = !controller.isConfirmPassVisible.value;
                  },
                  child: Obx(
                        () => Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Icon(
                        controller.isConfirmPassVisible.value ? Icons.visibility : Icons.visibility_off_outlined,
                        size: 25,
                        color: ColorsTheme.col252525,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text("password_desc".tr, style: regularTextStyle(fontSize: dimen13, color: ColorsTheme.colBlack),),
          const SizedBox(
            height: 70.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0,right: 40.0),
            child: GestureDetector(
              onTap: (){
                controller.isFill.value ? controller.onNext(1) : SnackBarUtil.showError(message: "Required missing field");
              },
              child: Container(
                width: Get.width,
                height: 65.0,
                decoration: controller.isFill.value ? const BoxDecoration(
                  color: Color(0xff2454FF),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ) : const BoxDecoration(
                  color: Color(0xff9CA6CC),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Center(child: Text("next_step".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${"already".tr} ${"have_an_account".tr}", style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),),
              GestureDetector(
                  onTap: (){
                    Get.offNamed(Routes.login);
                  },
                  child: Text(" Login".tr, style: boldTextStyle(fontSize: dimen16, color: ColorsTheme.colBlack),)),
            ],
          ),
        ],
      ),
    );
  }

  step2() {
    return Container(
      // width: Get.width,
      // height: Get.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Basic Details".tr, style: boldTextStyle(fontSize: dimen16, color: ColorsTheme.colBlack),),
              Text("step2/3".tr, style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),)
            ],
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: Get.width,
            height: 68.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  width: 1,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(20))),
            child: TextField(
              controller: controller.firstName,
              onChanged: (text) {
                controller.checkStep2FillOrNot();
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "First Name".tr,
                hintStyle: regularTextStyle(fontSize: dimen15, color: const Color(0xff9CA6CC)),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
              ),
              style: regularTextStyle(fontSize: dimen15, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: Get.width,
            height: 68.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  width: 1,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(20))),
            child: TextField(
              controller: controller.middlename,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Middle Name (optional)".tr,
                hintStyle: regularTextStyle(fontSize: dimen15, color: const Color(0xff9CA6CC)),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
              ),
              style: regularTextStyle(fontSize: dimen15, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: Get.width,
            height: 68.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  width: 1,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(20))),
            child: TextField(
              controller: controller.lastName,
              onChanged: (text) {
                controller.checkStep2FillOrNot();
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Last Name".tr,
                hintStyle: regularTextStyle(fontSize: dimen15, color: const Color(0xff9CA6CC)),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
              ),
              style: regularTextStyle(fontSize: dimen15, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: Get.width,
            height: 68.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  width: 1,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(20))),
            child: TextField(
              controller: controller.email,
              onChanged: (text) {
                controller.checkStep2FillOrNot();
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Email Address".tr,
                hintStyle: regularTextStyle(fontSize: dimen15, color: const Color(0xff9CA6CC)),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
              ),
              style: regularTextStyle(fontSize: dimen15, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: Get.width,
            height: 70.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  width: 1,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(20))),
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                controller.checkStep2FillOrNot();
              },
              onInputValidated: (bool value) {
                controller.checkStep2FillOrNot();
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: PhoneNumber(isoCode: 'US'),
              textFieldController: controller.phoneNumber,
              inputDecoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Phone Number".tr,
                hintStyle: regularTextStyle(fontSize: dimen15, color: const Color(0xff9CA6CC)),
                border: InputBorder.none,
              ),
              textStyle: regularTextStyle(fontSize: dimen16, color: Colors.black),
            )
            ,
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: Get.width,
            height: 68.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  width: 1,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(20))),
            child: TextField(
              controller: controller.dob,
              onChanged: (text) {
                controller.checkFillOrNot();
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Date of birth".tr,
                hintStyle: regularTextStyle(fontSize: dimen15, color: const Color(0xff9CA6CC)),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
              ),
              style: regularTextStyle(fontSize: dimen15, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0,right: 40.0),
            child: GestureDetector(
              onTap: (){
                controller.isStep2Fill.value ? controller.onNext(2) : SnackBarUtil.showError(message: "Required missing field");
                // Get.toNamed(Routes.welcomepage);
              },
              child: Container(
                width: Get.width,
                height: 64.0,
                decoration: controller.isStep2Fill.value ? const BoxDecoration(
                  color: Color(0xff2454FF),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ) : const BoxDecoration(
                  color: Color(0xff9CA6CC),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Center(child: Text("next_step".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  step3() {
    return Expanded(
      child: CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(delegate:
          SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  // width: Get.width,
                  // height: Get.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Payment Details".tr, style: boldTextStyle(fontSize: dimen16, color: ColorsTheme.colBlack),),
                          Text("step3/3".tr, style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),)
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text("Why do we need these payment details?".tr, style: boldTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore".tr, style: regularTextStyle(fontSize: dimen13, color: ColorsTheme.colBlack),),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        // padding: const EdgeInsets.all(10.0),
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey.shade200,
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                              child: GestureDetector(
                                onTap: (){
                                  controller.paymentMethodType("bankAccount");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        controller.paymentMethod.value == "bankAccount" ? Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,) :
                                        Image.asset("assets/images/unselected_btn.png", width: 24.0, height: 24.0,),
                                        const SizedBox(width: 15.0,),
                                        Text("Bank Account".tr, style: semiBoldTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),),
                                      ],
                                    ),
                                    Image.asset("assets/images/bank_acc_icon.png", width: 24.0, height: 24.0,),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Visibility(
                                visible:  controller.paymentMethod.value == "bankAccount" ? true : false,
                                child: Column(
                                  children: [
                                    Divider(height: 1.0, color: Colors.blueGrey,),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextField(
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Account Holder Name".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    TextField(
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Account Number".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    TextField(
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Bank Code".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0,right: 40.0, top: 20, bottom: 20),
                                      child: GestureDetector(
                                        onTap: (){
                                          // Get.toNamed(Routes.welcomepage);
                                        },
                                        child: Container(
                                          width: 200.0,
                                          height: 50.0,
                                          decoration: controller.isFill.value ? const BoxDecoration(
                                            color: Color(0xff2454FF),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ) : const BoxDecoration(
                                            color: Color(0xff9CA6CC),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ),
                                          child: Center(child: Text("Save".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey.shade200,
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                              child: GestureDetector(
                                onTap: (){
                                  controller.paymentMethodType("creditCard");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        controller.paymentMethod.value == "creditCard" ? Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,) :
                                        Image.asset("assets/images/unselected_btn.png", width: 24.0, height: 24.0,),
                                        const SizedBox(width: 15.0,),
                                        Text("Credit/Debit Card".tr, style: semiBoldTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),),
                                      ],
                                    ),
                                    Image.asset("assets/images/credit_card_icon.png", width: 24.0, height: 24.0,),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Visibility(
                                visible: controller.paymentMethod.value == "creditCard" ? true : false,
                                child: Column(
                                  children: [
                                    const Divider(height: 1.0, color: Colors.blueGrey,),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextField(
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Card Holder Name".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),

                                    TextField(
                                      controller : MaskedTextController(mask: '0000 0000 0000 0000'),
                                      keyboardType: TextInputType.number,
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Card Number".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(19),
                                        // You can add more formatters or validators as needed
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: Get.width,
                                            child: Column(
                                              children: [
                                                TextField(
                                                  controller : MaskedTextController(mask: '00/00'),
                                                  keyboardType: TextInputType.number,
                                                  style: regularTextStyle(
                                                      fontSize: dimen15, color: Colors.black),
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    hintText: "Expiry (MM/YY)".tr,
                                                    hintStyle: regularTextStyle(
                                                        fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                                    border: InputBorder.none,
                                                  ),
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(5),
                                                    // You can add more formatters or validators as needed
                                                  ],
                                                ),
                                                const Divider(height: 2.0, color: Colors.blueGrey, indent: 10,endIndent: 10,),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: Get.width,
                                            child: Column(
                                              children: [
                                                TextField(
                                                  keyboardType: TextInputType.number,
                                                  obscureText: true,
                                                  style: regularTextStyle(
                                                      fontSize: dimen15, color: Colors.black),
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    hintText: "CVV/CVC".tr,
                                                    hintStyle: regularTextStyle(
                                                        fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                                    border: InputBorder.none,
                                                  ),
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(3),
                                                    // You can add more formatters or validators as needed
                                                  ],
                                                ),
                                                const Divider(height: 2.0, color: Colors.blueGrey, indent: 10,endIndent: 15,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0,right: 40.0, top: 20, bottom: 20),
                                      child: GestureDetector(
                                        onTap: (){
                                          // Get.toNamed(Routes.welcomepage);
                                        },
                                        child: Container(
                                          width: 200.0,
                                          height: 50.0,
                                          decoration: controller.isFill.value ? const BoxDecoration(
                                            color: Color(0xff2454FF),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ) : const BoxDecoration(
                                            color: Color(0xff9CA6CC),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ),
                                          child: Center(child: Text("Save".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey.shade200,
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                              child: GestureDetector(
                                onTap: (){
                                  controller.paymentMethodType("mobileMoney");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        controller.paymentMethod.value == "mobileMoney" ? Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,) :
                                        Image.asset("assets/images/unselected_btn.png", width: 24.0, height: 24.0,),
                                        const SizedBox(width: 15.0,),
                                        Text("Mobile Money".tr, style: semiBoldTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),),
                                      ],
                                    ),
                                    Image.asset("assets/images/mobile_money_icon.png", width: 24.0, height: 24.0,),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Visibility(
                                visible:  controller.paymentMethod.value == "mobileMoney" ? true : false,
                                child: Column(
                                  children: [
                                    const Divider(height: 1.0, color: Colors.blueGrey,),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextField(
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Register Mobile Number".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0,right: 40.0, top: 20, bottom: 20),
                                      child: GestureDetector(
                                        onTap: (){
                                          // Get.toNamed(Routes.welcomepage);
                                        },
                                        child: Container(
                                          width: 200.0,
                                          height: 50.0,
                                          decoration: controller.isFill.value ? const BoxDecoration(
                                            color: Color(0xff2454FF),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ) : const BoxDecoration(
                                            color: Color(0xff9CA6CC),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ),
                                          child: Center(child: Text("login".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey.shade200,
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                              child: GestureDetector(
                                onTap: (){
                                  controller.paymentMethodType("paypal");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        controller.paymentMethod.value == "paypal" ? Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,) :
                                        Image.asset("assets/images/unselected_btn.png", width: 24.0, height: 24.0,),
                                        const SizedBox(width: 15.0,),
                                        Text("Paypal".tr, style: semiBoldTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),),
                                      ],
                                    ),
                                    Image.asset("assets/images/paypal_icon.png", width: 24.0, height: 24.0,),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Visibility(
                                visible:  controller.paymentMethod.value == "paypal" ? true : false,
                                child: Column(
                                  children: [
                                    const Divider(height: 1.0, color: Colors.blueGrey,),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextField(
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Email/Username".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    TextField(
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "password".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0,right: 40.0, top: 20, bottom: 20),
                                      child: GestureDetector(
                                        onTap: (){
                                          // Get.toNamed(Routes.welcomepage);
                                        },
                                        child: Container(
                                          width: 200.0,
                                          height: 50.0,
                                          decoration: controller.isFill.value ? const BoxDecoration(
                                            color: Color(0xff2454FF),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ) : const BoxDecoration(
                                            color: Color(0xff9CA6CC),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ),
                                          child: Center(child: Text("login".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey.shade200,
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                              child: GestureDetector(
                                onTap: (){
                                  controller.paymentMethodType("zelle");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        controller.paymentMethod.value == "zelle" ? Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,) :
                                        Image.asset("assets/images/unselected_btn.png", width: 24.0, height: 24.0,),
                                        const SizedBox(width: 15.0,),
                                        Text("Zelle".tr, style: semiBoldTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),),
                                      ],
                                    ),
                                    Image.asset("assets/images/zelle_icon.png", width: 24.0, height: 24.0,),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Visibility(
                                visible:  controller.paymentMethod.value == "zelle" ? true : false,
                                child: Column(
                                  children: [
                                    const Divider(height: 1.0, color: Colors.blueGrey,),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextField(
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Register Mobile Number".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0,right: 40.0, top: 20, bottom: 20),
                                      child: GestureDetector(
                                        onTap: (){
                                          // Get.toNamed(Routes.welcomepage);
                                        },
                                        child: Container(
                                          width: 200.0,
                                          height: 50.0,
                                          decoration: controller.isFill.value ? const BoxDecoration(
                                            color: Color(0xff2454FF),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ) : const BoxDecoration(
                                            color: Color(0xff9CA6CC),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ),
                                          child: Center(child: Text("login".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey.shade200,
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                              child: GestureDetector(
                                onTap: (){
                                  controller.paymentMethodType("orangeMoney");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        controller.paymentMethod.value == "orangeMoney" ? Image.asset("assets/images/selected_btn.png", width: 24.0, height: 24.0,) :
                                        Image.asset("assets/images/unselected_btn.png", width: 24.0, height: 24.0,),
                                        const SizedBox(width: 15.0,),
                                        Text("Orange Money".tr, style: semiBoldTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),),
                                      ],
                                    ),
                                    Image.asset("assets/images/orange_money_icon.png", width: 24.0, height: 24.0,),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Visibility(
                                visible:  controller.paymentMethod.value == "orangeMoney" ? true : false,
                                child: Column(
                                  children: [
                                    const Divider(height: 1.0, color: Colors.blueGrey,),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextField(
                                      style: regularTextStyle(
                                          fontSize: dimen15, color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Register Mobile Number".tr,
                                        hintStyle: regularTextStyle(
                                            fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 15.0),
                                      child: Divider(height: 2.0, color: Colors.blueGrey,),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0,right: 40.0, top: 20, bottom: 20),
                                      child: GestureDetector(
                                        onTap: (){
                                          // Get.toNamed(Routes.welcomepage);
                                        },
                                        child: Container(
                                          width: 200.0,
                                          height: 50.0,
                                          decoration: controller.isFill.value ? const BoxDecoration(
                                            color: Color(0xff2454FF),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ) : const BoxDecoration(
                                            color: Color(0xff9CA6CC),
                                            borderRadius: BorderRadius.all(Radius.circular(40)),
                                          ),
                                          child: Center(child: Text("login".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0,right: 40.0),
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.verify,arguments: [false, "", ""]);
                          },
                          child: Container(
                            width: Get.width,
                            height: 64.0,
                            decoration: controller.isFill.value ? const BoxDecoration(
                              color: Color(0xff2454FF),
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ) : const BoxDecoration(
                              color: Color(0xff9CA6CC),
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            child: Center(child: Text("signup".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              )
            ]
          ))
        ],
      ),
    );
  }
}
