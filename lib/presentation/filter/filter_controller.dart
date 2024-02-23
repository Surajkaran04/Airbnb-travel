import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController{
  var arrDocStatus = ["Pending", "Found", "Fee Paid", "Marked"];
  var arrSelectedIndex = [].obs;
  var arrSelectedIndex2 = [].obs;

  var arrTitle = ["Identity", "Education", "Automobile", "Certificate"];
  var arrIcon = ["assets/images/identity_icon.png","assets/images/education_icon.png","assets/images/automobile_icon.png","assets/images/certificate_icon.png",];
  var arrIconColor = [const Color(0xff8DD200),const Color(0xff00AFA3),const Color(0xff7240FF),const Color(0xffFF8800), ];
  var identityItemList = ["National Identity", "Drivers License", "Passport", "Professional Card", "Residence cards", "Refugee Card", "Consular Card",];
  var educationItemList = ["High School Diploma", "College Degree", "University Degree", "Vocational Degree or License",];
  var automobileItemList = ["Insurance Card (Personal)", "Insurance Card (Automobile)", "Temporary Receipt Number", "Automobile Registration Card",];
  var certificateItemList = ["Birth Certificate", "Marriage Certificate"];

  selectedIndex(index){
    if(arrSelectedIndex.contains(index)){
      return arrSelectedIndex.remove(index);
    } else {
      return arrSelectedIndex.add(index);
    }
  }

  selectedIndex2(item){
    if(arrSelectedIndex2.contains(item)){
      return arrSelectedIndex2.remove(item);
    } else {
      return arrSelectedIndex2.add(item);
    }
  }


  checkIndexItem(int pos, index){
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

  checkIndex(index){
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

  checkIndexList(index){
    if(index == 0){
      return identityItemList;
    } else if (index == 1){
      return educationItemList;
    } else if (index == 2) {
      return automobileItemList;
    } else {
      return certificateItemList;
    }
  }
}