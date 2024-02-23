import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/infrastructure/theme/text.theme.dart';
import 'package:appentus_dummy/presentation/forgotUsername/emailSent/email_sent_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/theme/colors.theme.dart';

class EmailSentPage extends BaseView<EmailSentController>{
  EmailSentPage({super.key});

  onInit(){
    Get.arguments[0];
    Get.arguments[1];
  }
  
  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: Get.width,
                height: Get.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 150.0,),
                    Lottie.asset(width: 200.0, height: 200.0, "assets/images/gpay_tic.json"),
                    const SizedBox(height: 40.0,),
                    Visibility(
                        visible: Get.arguments[0] ? false : true,
                        child: Text("Email Sent".tr, style: boldTextStyle(fontSize: dimen24, color: Colors.black),)),
                    Visibility(
                        visible: Get.arguments[0] ? true : false,
                        child: Text("Message Sent".tr, style: boldTextStyle(fontSize: dimen24, color: Colors.black),)),
                    const SizedBox(height: 20.0,),
                    // Text("We've sent your Username to your registered".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),),
                    // Text("email address johndeo@gmail.com.".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),),
                    // Text("Please check your email inbox.".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),),
                    Visibility(
                      visible: Get.arguments[0] ? false : true,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "We've sent your Username to your registered\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "email address ${Get.arguments[1]}.\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "Please check your email inbox.".tr,
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: Get.arguments[0] ? true : false,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "We've sent your Username to your registered\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "phone number ${Get.arguments[1]}.\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "Please check your message inbox.".tr,
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 100.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 40.0, bottom: 30.0),
                      child: GestureDetector(
                        onTap: (){
                          Get.offAllNamed(Routes.login);
                        },
                        child: Container(
                          width: Get.width,
                          height: 64.0,
                          decoration: const BoxDecoration(
                            color: Color(0xff2454FF),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Center(child: Text("login".tr, style: regularTextStyle(fontSize: dimen16, color: ColorsTheme.colWhite),)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

}