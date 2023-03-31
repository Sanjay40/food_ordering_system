import 'package:flutter/material.dart';
import 'package:food_ordering_system/view/AddToCart.dart';
import 'package:food_ordering_system/view/favourite.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
    RxInt currentIndex  = 0.obs;
    List getData = [];
    tabIndex(int val){
      currentIndex.value  = val;
      if(currentIndex.value == 1){
        //Get.to(() => FavouriteScreen());
      }
      else if(currentIndex.value == 2){
        Get.to(() => AddToCartScreen());
      }
    }

}