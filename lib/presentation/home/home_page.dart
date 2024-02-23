import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/infrastructure/navigation/routes.dart';
import 'package:appentus_dummy/presentation/home/home_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class HomePage extends BaseView<HomeController>{
  HomePage({super.key});

  @override
  Widget body(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Container(
      width: Get.width,
      height: Get.height,
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate(
                  [
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          appBarDashboard(),
                          const SizedBox(height: 20.0,),
                          Container(
                            width: Get.width,
                              child: Text("Find Your Lost Document", style: boldTextStyle(fontSize: dimen18, color: Colors.black), textAlign: TextAlign.start)),
                          const SizedBox(height: 15.0,),
                          Text("Find your lost documents, add your documents, search with your name and registration number, and then revert them.",
                            style: regularTextStyle(fontSize: dimen14, color: Colors.black),),
                          const SizedBox(height: 15.0,),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blue, width: 1.0),
                              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 3.0, bottom: 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/search_icon.png", width: 20.0, height: 20.0,),
                                  const SizedBox(width: 10.0,),
                                  Container(
                                    width: Get.width-100,
                                    child: TextField(
                                      // controller: controller.emailAddress,
                                      onChanged: (text) {
                                        // controller.checkFillOrNot();
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Search document by name, reg. number...".tr,
                                        hintStyle: regularTextStyle(fontSize: dimen15, color: const Color(0xff9CA6CC)),
                                        border: InputBorder.none,
                                        // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width),
                                      ),
                                      style: regularTextStyle(fontSize: dimen15, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0,),
                          Container(
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cetegory".tr, style: boldTextStyle(fontSize: dimen16, color: Colors.black),),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.category);
                                  },
                                  child: Container(
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.blue, width: 1.0),
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                    ),
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("See all".tr, style: boldTextStyle(fontSize: dimen15, color: Colors.blue),),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 165.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xffE3FFAA),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: const Color(0xff8DD200),
                                              child: Image.asset("assets/images/identity_icon.png", width: 50.0, height: 50.0,)),
                                          const SizedBox(width: 20.0,),
                                          Text("0 Doc", style: regularTextStyle(fontSize: dimen13, color: Colors.black),)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5.0,),
                                    Container(
                                        width: 145.0,
                                        child: Text("Identity", style: boldTextStyle(fontSize: dimen15, color: Colors.black),)),
                                    const SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 20.0),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Upload National Identity,\n",
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(height: 20), // Add spacing between text spans
                                            ),
                                            TextSpan(
                                              text: "Drivers License,\n",
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(height: 20), // Add spacing between text spans
                                            ),
                                            TextSpan(
                                              text: "Passport, and more".tr,
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 165.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xffCEFFFC),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: const Color(0xff00AFA3),
                                              child: Image.asset("assets/images/education_icon.png", width: 50.0, height: 50.0,)),
                                          const SizedBox(width: 20.0,),
                                          Text("0 Doc", style: regularTextStyle(fontSize: dimen13, color: Colors.black),)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5.0,),
                                    Container(
                                        width: 145.0,
                                        child: Text("Education", style: boldTextStyle(fontSize: dimen15, color: Colors.black),)),
                                    const SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 5.0, bottom: 20.0),
                                      child: Container(
                                        width: Get.width,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Upload High School\n",
                                                style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                              ),
                                              const WidgetSpan(
                                                child: SizedBox(height: 20), // Add spacing between text spans
                                              ),
                                              TextSpan(
                                                text: "Diploma, College\n",
                                                style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                              ),
                                              const WidgetSpan(
                                                child: SizedBox(height: 20), // Add spacing between text spans
                                              ),
                                              TextSpan(
                                                text: "Degree,and more".tr,
                                                style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 165.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xffEFE9FF),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: const Color(0xff7240FF),
                                              child: Image.asset("assets/images/automobile_icon.png", width: 50.0, height: 50.0,)),
                                          const SizedBox(width: 20.0,),
                                          Text("0 Doc", style: regularTextStyle(fontSize: dimen13, color: Colors.black),)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5.0,),
                                    Container(
                                        width: 145.0,
                                        child: Text("Automobile", style: boldTextStyle(fontSize: dimen15, color: Colors.black),)),
                                    const SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 20.0),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Upload Insurance Card,\n",
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(height: 20), // Add spacing between text spans
                                            ),
                                            TextSpan(
                                              text: "Automobile Registration\n",
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(height: 20), // Add spacing between text spans
                                            ),
                                            TextSpan(
                                              text: "Card, and more".tr,
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 165.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xffFFEAD2),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: const Color(0xffFF8800),
                                              child: Image.asset("assets/images/certificate_icon.png", width: 50.0, height: 50.0,)),
                                          const SizedBox(width: 20.0,),
                                          Text("0 Doc", style: regularTextStyle(fontSize: dimen13, color: Colors.black),)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5.0,),
                                    Container(
                                        width: 145.0,
                                        child: Text("Certificate", style: boldTextStyle(fontSize: dimen15, color: Colors.black),)),
                                    const SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 5.0, bottom: 20.0),
                                      child: Container(
                                        width: Get.width,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Upload Marriage\n",
                                                style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                              ),
                                              const WidgetSpan(
                                                child: SizedBox(height: 20), // Add spacing between text spans
                                              ),
                                              TextSpan(
                                                text: "Certificate,\n",
                                                style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                              ),
                                              const WidgetSpan(
                                                child: SizedBox(height: 20), // Add spacing between text spans
                                              ),
                                              TextSpan(
                                                text: "Birth Certificate".tr,
                                                style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0,),
                          Container(
                              width: Get.width,
                              child: Text("My Lost Documents", style: boldTextStyle(fontSize: dimen16, color: Colors.black), textAlign: TextAlign.start)),
                          const SizedBox(height: 20.0,),
                          Container(
                              width: Get.width,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffEFFAFF),
                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: DottedBorder(
                                padding: const EdgeInsets.all(15.0),
                                borderType: BorderType.RRect,
                                  radius: const Radius.circular(25.0),
                                  color: const Color(0xffAAD4E6),
                                  strokeWidth: 1.5,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: Get.width,
                                        child: Text("+ Add Your Lost Documents",
                                          style: regularTextStyle(fontSize: dimen15, color: const Color(0xff2454FF)),),
                                      ),
                                      const SizedBox(height: 15.0,),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Add your lost documents to help us find them.\n",
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(height: 10), // Add spacing between text spans
                                            ),
                                            TextSpan(
                                              text: "You will be notified when other people upload \n",
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(height: 10), // Add spacing between text spans
                                            ),
                                            TextSpan(
                                              text: "their lost documents.".tr,
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                            ,
                          ),
                          const SizedBox(height: 20.0,),
                          Container(
                              width: Get.width,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffEFFAFF),
                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: DottedBorder(
                                padding: const EdgeInsets.all(15.0),
                                borderType: BorderType.RRect,
                                  radius: const Radius.circular(25.0),
                                  color: const Color(0xffAAD4E6),
                                  strokeWidth: 1.5,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: Get.width,
                                        child: Text("+ Add Other's People Lost Documents",
                                          style: regularTextStyle(fontSize: dimen15, color: const Color(0xff2454FF)),),
                                      ),
                                      const SizedBox(height: 15.0,),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Adding other people's lost documents will help \n",
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(height: 15), // Add spacing between text spans
                                            ),
                                            TextSpan(
                                              text: "you find theirs once you upload the document,\n",
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(height: 15), // Add spacing between text spans
                                            ),
                                            TextSpan(
                                              text: "we match the data, and we will notify both of you.".tr,
                                              style: regularTextStyle(fontSize: dimen12, color: ColorsTheme.colBlack),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                            ,
                          ),
                          const SizedBox(height: 20.0,),
                        ],
                      ),
                    )
                  ]
              ))
        ],
      ),
    );
  }

  appBarDashboard() {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.profile);
                  },
                  child: Image.asset("assets/images/profile_icon.png", width: 50.0, height: 50.0,)),
              const SizedBox(width: 20.0,),
              Text("Hey, ${controller.userName.value}", style: boldTextStyle(fontSize: dimen16, color: Colors.black),)
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.notification);
                  },
                  child: CircleAvatar(backgroundColor: const Color(0xffEEF5FF),child: Image.asset("assets/images/notification_icon.png", width: 50.0, height: 50.0,),)),
              const SizedBox(width: 10.0,),
              CircleAvatar(backgroundColor: const Color(0xffEEF5FF),child: Image.asset("assets/images/menu_icon.png", width: 50.0, height: 50.0,) ),
            ],
          ),
        ],
      ),
    );
  }

}