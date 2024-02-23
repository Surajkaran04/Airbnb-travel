import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/presentation/filter/filter_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../infrastructure/theme/text.theme.dart';

class FilterPage extends BaseView<FilterController>{
  FilterPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Obx(() => Container(
                width: Get.width,
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(height: 20.0,),
                      Container(
                          width: Get.width,
                          padding: EdgeInsets.only(left: 5),
                          child: Text("Filters",
                            style: boldTextStyle(
                                fontSize: dimen18, color: Colors.black),
                          )),
                      const SizedBox(height: 20.0,),
                      Container(
                          width: Get.width,
                          padding: EdgeInsets.only(left: 5),
                          child: Text("Document Status",
                            style: semiBoldTextStyle(
                                fontSize: dimen16, color: Colors.black),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Wrap(
                            spacing: 15.0,
                            runSpacing: 15.0,
                            children: List.generate(controller.arrDocStatus.length, (index) => InkWell(
                                onTap: () {
                                  controller.selectedIndex(index);
                                },
                                child: Container(
                                  width: 90,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: controller.arrSelectedIndex.contains(index) ? const Color(0xff2454FF) : Colors.white,
                                      border: Border.all(
                                        color: controller.arrSelectedIndex.contains(index) ? const Color(0xff2454FF) : Colors.blueGrey
                                      ),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                      child: Text(controller.arrDocStatus[index],
                                        style: regularTextStyle(fontSize: dimen14, color: controller.arrSelectedIndex.contains(index) ? Colors.white : Colors.black),
                                        textAlign: TextAlign.center,)),
                                )),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(height: 2, color: Colors.blueGrey,),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: Get.width,
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("Document Category",
                            style: semiBoldTextStyle(
                                fontSize: dimen16, color: const Color(0xff2454FF)),
                          )),
                      const SizedBox(
                        height: 20,
                      ),

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
                                children: [
                                  Container(
                                      width: Get.width,
                                      child: Container(
                                        width: Get.width,
                                        child: Row(
                                          children: [
                                            Text(controller.arrTitle[index], style: semiBoldTextStyle(fontSize: dimen16, color: Colors.black),),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(height: 20.0,),

                                  Obx(() => Container(
                                    child:
                                    Wrap(
                                      spacing: 20.0,
                                      runSpacing: 15.0,
                                      children: List.generate(controller.checkIndex(index), (indexSub) => InkWell(
                                        onTap: () {
                                          var list = controller.checkIndexList(index);
                                          controller.selectedIndex2(list[indexSub]);
                                          print("position - ${index}- ${indexSub}");
                                          print("list - ${list}");
                                        },
                                        child: Container(
                                          // padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: controller.arrSelectedIndex2.contains(controller.checkIndexList(index)[indexSub]) ? const Color(0xff2454FF) : Colors.white,
                                              border: Border.all(
                                                  color: controller.arrSelectedIndex2.contains(controller.checkIndexList(index)[indexSub]) ? const Color(0xff2454FF) : Colors.blueGrey
                                              ),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(controller.checkIndexItem(indexSub, index) , style: regularTextStyle(fontSize: dimen14, color: controller.arrSelectedIndex2.contains(controller.checkIndexList(index)[indexSub]) ? Colors.white : Colors.black), textAlign: TextAlign.center,),
                                          ),
                                        ),
                                      )),
                                    ),
                                  ))

                                  /*Container(
                                    width: Get.width,
                                    child:


                                    ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: controller.checkIndex(index),
                                        itemBuilder: (context, indexSub){
                                          var listSub = controller.checkIndexList(index);
                                          return GestureDetector(
                                            onTap: () {
                                              controller.selectedIndex2(indexSub);
                                            },
                                            child: Container(
                                              width: Get.width,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: controller.arrSelectedIndex2.contains(index) ? const Color(0xff2454FF) : Colors.white,
                                                  border: Border.all(
                                                      color: controller.arrSelectedIndex2.contains(index) ? const Color(0xff2454FF) : Colors.blueGrey
                                                  ),
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(listSub[indexSub] , style: regularTextStyle(fontSize: dimen14, color: Colors.black),),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),*/
                                ],
                              ),
                            );
                          },

                        ),
                      ),

                    ]),
              )),
            ]),
          ),
        ])
    );
  }

}