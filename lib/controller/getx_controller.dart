import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_system/view/AddToCart.dart';
import 'package:food_ordering_system/view/favourite.dart';
import 'package:get/get.dart';


// CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
//     .doc('All_food_list')
//     .collection(HomeController().category.value);

class HomeController extends GetxController{
    RxInt currentIndex  = 0.obs;
    List getData = [];
    static HomeController homeController = Get.put(HomeController());
    RxBool changeFavouriteValue = false.obs;
    RxInt changeQuantity = 1.obs;
    RxString category = 'Food'.obs;
    final searchText = ValueNotifier("");
    RxList AddToCart = [].obs;
    tabIndex(int val){
      currentIndex.value  = val;
      if(currentIndex.value == 1){
        Get.to(() => FavouriteScreen());
      }
      else if(currentIndex.value == 2){
        Get.to(() => AddToCartScreen());
      }
    }

    changeFavouriteData(){
      changeFavouriteValue.value = !changeFavouriteValue.value;
      update();
    }

    changeIncrementQuantity(){
      if(changeQuantity >= 1)
      {
       changeQuantity.value++;
      }
      update();
    }

    changeDecrementQuantity(){
      if(changeQuantity > 1)
      {
        changeQuantity.value --;
      }
      else{
        changeQuantity.value = 1;
      }
      update();
    }


    updateData({required int index, required bool changeFavData}) async {
      CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
          .doc('All_food_list')
          .collection(homeController.category.value);
      var docSnap = await collection.get();
      var docId = docSnap.docs;
      return collection
          .doc(docId[index].id)
         .update({'favourite' : changeFavData})
          .then((value) => print("User Update") )
          .catchError((error) => print("Error $error"));

    }

    updateQuantity({required int index, required int changeQuantity}) async {
      CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
          .doc('All_food_list')
          .collection(homeController.category.value);
      var docSnap = await collection.get();
      var docId = docSnap.docs;
      return collection
          .doc(docId[index].id)
          .update({'quantity' : changeQuantity})
          .then((value) => print("User Update") )
          .catchError((error) => print("Error $error"));

    }


}