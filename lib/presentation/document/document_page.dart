import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/presentation/document/document_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class DocumentPage extends BaseView<DocumentController> {
  DocumentPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(top: 20.0),
        child: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: Get.width,
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      width: Get.width,
                      child: Text("My Lost Documents",
                          style: boldTextStyle(
                              fontSize: dimen18, color: Colors.black),
                          textAlign: TextAlign.start)),
                  const SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width - 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
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
                                width: Get.width -180,
                                child: TextField(
                                  // controller: controller.emailAddress,
                                  onChanged: (text) {
                                    // controller.checkFillOrNot();
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Search document...".tr,
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
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.filter);
                        },
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 1.0),
                            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image.asset("assets/images/filter_icon.png", width: 24, height: 24,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0,),

                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(bottom: 20),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          width: Get.width,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFF8EF),
                              border: Border.all(color: const Color(0xffFF8800),),
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
                                      const CircleAvatar(
                                        backgroundColor: Colors.orange,
                                        child: Icon(Icons.report),
                                      ),
                                      // Image.asset("assets/images/profile_icon.png", width: 50.0, height: 50.0,),
                                      const SizedBox(width: 20.0,),
                                      Text("Birth Certificate", style: boldTextStyle(fontSize: dimen16, color: Colors.black),)
                                    ],
                                  ),
                                  Container(
                                    width: 80.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(25.0)
                                    ),
                                    child: Center(child: Text("Pending", style: regularTextStyle(fontSize: dimen13, color: Colors.white),)),
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
                      },),
                  ),

                ]),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
