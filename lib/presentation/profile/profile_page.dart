import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/presentation/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/text.theme.dart';

class ProfilePage extends BaseView<ProfileController> {
  ProfilePage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              width: MediaQuery.of(context).size.width,
              height: Get.height,
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: true,
                      child: Row(
                          children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            "assets/images/img_back_btn.png",
                            width: 35.0,
                            height: 35.0,
                          ),
                        ),
                        Center(
                            child: Container(
                                margin: EdgeInsets.only(left: 115),
                                child: Text(
                                  "Profile".tr,
                                  style: boldTextStyle(
                                      fontSize: dimen16, color: Colors.black),
                                )))
                      ]),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/profile_icon.png", width: 50.0, height: 50.0,),
                              const SizedBox(width: 20.0,),
                              Text(controller.userName.value, style: boldTextStyle(fontSize: dimen16, color: Colors.black),)
                            ],
                          ),
                          Container(
                            width: 60.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Center(child: Text("Edit", style: regularTextStyle(fontSize: dimen13, color: Colors.white),)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Divider(height: 2, color: Colors.grey,),
                    const SizedBox(height: 20,),
                    Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Username".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                          Text("johndeo_123".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Divider(height: 2, color: Colors.grey,),
                    const SizedBox(height: 20,),
                    Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Fist Name".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                          Text("john".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Divider(height: 2, color: Colors.grey,),
                    const SizedBox(height: 20,),
                    Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Middle Name".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                          Text("Michle".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Divider(height: 2, color: Colors.grey,),
                    const SizedBox(height: 20,),
                    Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Last Name".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                          Text("Deo".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Divider(height: 2, color: Colors.grey,),
                    const SizedBox(height: 20,),
                    Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email Address".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                          Text("johndeo@gmail.com".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Divider(height: 2, color: Colors.grey,),
                    const SizedBox(height: 20,),
                    Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Phone Number".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                          Text("+233-1234567890".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Divider(height: 2, color: Colors.grey,),
                    const SizedBox(height: 20,),
                    Container(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date of Birth".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                          Text("21 May 1998".tr, style: regularTextStyle(fontSize: dimen15, color: Colors.black),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Divider(height: 2, color: Colors.grey,),
                    const SizedBox(height: 30,),
                    Container(
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Change Password".tr, style: regularTextStyle(fontSize: dimen16, color: const Color(0xff2454FF)),),
                          const SizedBox(height: 20,),
                          Text("Log out".tr, style: regularTextStyle(fontSize: dimen16, color: const Color(0xff2454FF)),),
                          const SizedBox(height: 20,),
                          Text("Delete Account Permanently".tr, style: regularTextStyle(fontSize: dimen16, color: const Color(0xffFF3B3B)),),
                        ],
                      ),
                    ),
                  ]),
            ),
          ]),
        ),
      ]),
    );
  }
}
