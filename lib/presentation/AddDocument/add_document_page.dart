import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/presentation/AddDocument/add_document_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';

class AddDocumentPage extends BaseView<AddDocumentController> {
  AddDocumentPage({super.key});

  @override
  Widget body(BuildContext context) {
    Get.lazyPut(() => AddDocumentController());
    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
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
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              "assets/images/img_back_btn.png",
                              width: 35.0,
                              height: 35.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Add Your Document".tr,
                          style: boldTextStyle(
                              fontSize: dimen18, color: ColorsTheme.colBlack),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: Get.width,
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
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.arrTitle.length,
                              itemBuilder: (context, index){
                                return Container(
                                  width: Get.width,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                          width: Get.width,
                                          child: Container(
                                            width: Get.width,
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:  controller.arrIconColor[index],
                                                    child: Image.asset(controller.arrIcon[index], width: 20, height: 20,)
                                                ),
                                                SizedBox(width: 10,),
                                                Text(controller.arrTitle[index], style: semiBoldTextStyle(fontSize: dimen16, color: Colors.black),),
                                              ],
                                            ),
                                          )),
                                      const SizedBox(height: 10.0,),
                                      Container(
                                        width: Get.width,
                                        child: ListView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller.checkIndex(index),
                                            itemBuilder: (context, indexSub){
                                              var listSub = controller.checkIndexList(index);
                                          return Container(
                                            width: Get.width,
                                            height: 50,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(listSub[indexSub] , style: regularTextStyle(fontSize: dimen14, color: Colors.black),),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text("0/10", style: regularTextStyle(fontSize: dimen14, color: Colors.black)),
                                                        const SizedBox(width: 10,),
                                                        const Icon(Icons.arrow_forward, color: Colors.black,)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Divider(height: 2, thickness: 1, color: Colors.grey,)
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                );
                              },

                            ),
                        )
                      ]))
            ],
          ),
        ),
      ]),
    );
  }
}
