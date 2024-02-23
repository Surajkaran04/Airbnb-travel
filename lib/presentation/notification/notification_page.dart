import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/presentation/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class NotificationPage extends BaseView<NotificationController>{
  NotificationPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
        Container(
            width: MediaQuery.of(context).size.width,
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
                    Center(child: Container(
                        margin: EdgeInsets.only(left: 90),
                        child: Text("Notifications".tr, style: boldTextStyle(fontSize: dimen16, color: Colors.black),)))
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: Get.width,
                height: Get.height,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index){
                      return Container(
                        width: Get.width,
                        child: Column(
                          children: [
                            Container(
                                width: Get.width,
                                child: Text("John Deo, Documents found".tr, style: boldTextStyle(fontSize: dimen15, color: Colors.black),)
                            ),
                            const SizedBox(height: 10,),
                            Text("John Deo, DOB of 1 Jul 1998 documents found of passport with documents number of A09845543, Check the documents details of confirm of your original documents.".tr, style: regularTextStyle(fontSize: dimen13, color: Colors.black),),
                            const SizedBox(height: 10,),
                            Container(
                                width: Get.width,
                                child: Text("10:45 am, 15 Sep 2023".tr, style: regularTextStyle(fontSize: dimen14, color: Colors.grey),)),
                            const SizedBox(height: 10,),
                            const Divider(height: 2, color: Colors.grey,),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      );
                }),
              ),
          ]
        ),
        ),
              ]
            ))
          ],
        )
    );
  }

}