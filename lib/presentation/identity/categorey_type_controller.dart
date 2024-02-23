import 'package:get/get.dart';

class CategoryTypeController extends GetxController{
  var identityItemList = ["National Identity", "Drivers License", "Passport", "Professional Card", "Residence cards", "Refugee Card", "Consular Card",];
  var educationItemList = ["High School Diploma", "College Degree", "University Degree", "Vocational Degree or License",];
  var automobileItemList = ["Insurance Card (Personal)", "Insurance Card (Automobile)", "Temporary Receipt Number", "Automobile Registration Card",];
  var certificateItemList = ["Birth Certificate", "Marriage Certificate"];
  var index = 0;
  var type = "".obs;
  var clicked = false.obs;

  @override
  void onInit() {
    index = Get.arguments;
    super.onInit();
  }

  checkIndexItem(int pos){
    if(index == 0){
      return identityItemList[pos];
    } else if (index == 1){
      return educationItemList[pos];
    } else if (index == 2) {
      return automobileItemList[pos];
    } else {
      return certificateItemList[pos];
    }
  }

  checkIndex(){
    if(index == 0){
      return identityItemList.length;
    } else if (index == 1){
      return educationItemList.length;
    } else if (index == 2) {
      return automobileItemList.length;
    } else {
      return certificateItemList.length;
    }
  }

  checkTitle(){
    if(index == 0){
      return "Identity";
    } else if (index == 1){
      return "Education";
    } else if (index == 2) {
      return "Automobile";
    } else {
      return "Certificate";
    }
  }
}