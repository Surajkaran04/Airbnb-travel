import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/presentation/identity/categorey_type_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class CategoryTypePage extends BaseView<CategoryTypeController>{
  CategoryTypePage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: Obx(() => controller.clicked.value ? tabLayout() : mainLayout())
    );
  }

  mainLayout(){
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
            width: Get.width,
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
                                margin: const EdgeInsets.only(left: 100),
                                child: Text(
                                  controller.checkTitle(),
                                  style: boldTextStyle(
                                      fontSize: dimen16, color: Colors.black),
                                ))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: const Color(0xff8DD200),
                            child: Image.asset("assets/images/identity_icon.png", width: 20, height: 20,)),
                        SizedBox(width: 10,),
                        Container(
                            child: Text(
                              controller.checkTitle(),
                              style: boldTextStyle(
                                  fontSize: dimen16, color: Colors.black),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.checkIndex(),
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: () {
                            controller.clicked.value = true;
                          },
                          child: Container(
                            width: Get.width,
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.checkIndexItem(index), style: regularTextStyle(fontSize: dimen14, color: Colors.black),),
                                Row(
                                  children: [
                                    Text("0/10", style: regularTextStyle(fontSize: dimen14, color: Colors.black),),
                                    SizedBox(width: 10,),
                                    Icon(Icons.arrow_forward, color: Colors.black,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return Divider(height: 2, thickness: 1,);
                    },),
                  )
                ]),
          ),
        ]),
      ),
    ]);
  }

  tabLayout(){
    return DefaultTabController(
      length: 2,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
              child: Visibility(
                visible: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      controller.checkTitle(),
                      style: boldTextStyle(
                          fontSize: dimen16, color: Colors.black),
                    ),
                    const SizedBox(width: 15,)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TabBar(
              tabs: [
                Text('My Lost\nDocument',textAlign: TextAlign.center),
                Text("Other's people\n Lost Document",textAlign: TextAlign.center),
              ],
              indicatorColor: Color(0xff2454FF),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Color(0xff2454FF),
              unselectedLabelColor: Colors.blueGrey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              labelPadding: EdgeInsets.only(bottom:15,),
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight
                      .normal),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    width: Get.width,
                  padding: const EdgeInsets.all(15.0),
                  child: tab1(),
                ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(15.0),
                    child: tab2(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  tab1(){
    return Container(
      width: Get.width,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:1,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            width: Get.width,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color(0xffF9FFEC),
                border: Border.all(color: const Color(0xff8dd200),),
                borderRadius: BorderRadius.circular(25.0)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff8DD200),
                          child: Image.asset("assets/images/identity_icon.png", width: 24.0, height: 24.0,),
                        ),
                        // Image.asset("assets/images/profile_icon.png", width: 50.0, height: 50.0,),
                        const SizedBox(width: 20.0,),
                        Text("National Identity", style: boldTextStyle(fontSize: dimen16, color: Colors.black),)
                      ],
                    ),
                    Visibility(
                      visible: false,
                      child: Container(
                        width: 80.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        child: Center(child: Text("Pending", style: regularTextStyle(fontSize: dimen13, color: Colors.white),)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0,),
                Container(
                  width: Get.width,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Jones Charles\n",
                          style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                        ),
                        const WidgetSpan(
                          child: SizedBox(height: 30), // Add spacing between text spans
                        ),
                        TextSpan(
                          text: "5294267842450618\n",
                          style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                        ),
                        const WidgetSpan(
                          child: SizedBox(height: 30), // Add spacing between text spans
                        ),
                        TextSpan(
                          text: "15 May 1998".tr,
                          style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },)
    );
  }
  tab2(){
    return Container(
      width: Get.width,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:1,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            width: Get.width,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color(0xffF9FFEC),
                border: Border.all(color: const Color(0xff8dd200),),
                borderRadius: BorderRadius.circular(25.0)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff8DD200),
                          child: Image.asset("assets/images/identity_icon.png", width: 20.0, height: 20.0,),
                        ),
                        // Image.asset("assets/images/profile_icon.png", width: 50.0, height: 50.0,),
                        const SizedBox(width: 20.0,),
                        Text("Passport", style: boldTextStyle(fontSize: dimen16, color: Colors.black),)
                      ],
                    ),
                    Visibility(
                      visible: false,
                      child: Container(
                        width: 80.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        child: Center(child: Text("Pending", style: regularTextStyle(fontSize: dimen13, color: Colors.white),)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0,),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Jones Charles\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "5294267842450618\n",
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 30), // Add spacing between text spans
                            ),
                            TextSpan(
                              text: "15 May 1998".tr,
                              style: regularTextStyle(fontSize: dimen15, color: ColorsTheme.colBlack),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/images/welcome_img.png", width: 100.0, height: 100.0,)
                    ],
                  ),
                ),
              ],
            ),
          );
        },)
    );
  }

}