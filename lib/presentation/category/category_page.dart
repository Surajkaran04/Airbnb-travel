import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/infrastructure/navigation/routes.dart';
import 'package:appentus_dummy/presentation/category/category_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../infrastructure/theme/text.theme.dart';

class CategoryPage extends BaseView<CategoryController> {
  CategoryPage({super.key});

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
                                margin: const EdgeInsets.only(left: 90),
                                child: Text(
                                  "Category".tr,
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
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.arrTitle.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                                Get.toNamed(Routes.identity, arguments: index);
                            },
                            child: Container(
                              width: Get.width,
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: controller.arrBgColor[index],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                backgroundColor:
                                                    controller.arrIconColor[index],
                                                child: Image.asset(
                                                  controller.arrIcon[index],
                                                  width: 50.0,
                                                  height: 50.0,
                                                )),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              controller.arrTitle[index],
                                              style: boldTextStyle(
                                                  fontSize: dimen16,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "0 Docs",
                                          style: regularTextStyle(
                                              fontSize: dimen13,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Container(
                                      width: Get.width,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              bottom: 20.0),
                                          child: Container(
                                              width: Get.width,
                                              child: Text(
                                                "Upload National Identity, Drivers License, Passport, and more",
                                                style: regularTextStyle(
                                                    fontSize: dimen13,
                                                    color: Colors.black),
                                              )))),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ]),
          ),
        ]),
      ),
    ]));
  }
}
