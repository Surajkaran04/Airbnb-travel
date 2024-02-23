import 'package:appentus_dummy/infrastructure/core/base/base_view.dart';
import 'package:appentus_dummy/infrastructure/theme/text.theme.dart';
import 'package:appentus_dummy/presentation/AddDocument/add_document_page.dart';
import 'package:appentus_dummy/presentation/dashboard/dashboard_controller.dart';
import 'package:appentus_dummy/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../document/document_page.dart';

class DashboardPage extends BaseView<DashboardController>{
  DashboardPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          child: Obx(() => IndexedStack(
                  index: controller.tabIndex.value,
                  children:  [
                    HomePage(),
                    AddDocumentPage(),
                    DocumentPage(),
                  ],
                ),),
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(

            // type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.blueGrey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              controller.changeTabIndex(index);
            },
            currentIndex: controller.tabIndex.value,
            items:  const [
              BottomNavigationBarItem(
                // icon: Image.asset("assets/images/home_icon.png"),
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: "Add Document",
                  backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit_document),
                  label: "Documents",
                  backgroundColor: Colors.white
              ),
            ])),
      ),
    );
  }





}