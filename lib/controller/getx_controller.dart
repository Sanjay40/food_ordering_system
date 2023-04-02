import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_system/view/AddToCart.dart';
import 'package:food_ordering_system/view/favourite.dart';
import 'package:get/get.dart';


CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
    .doc('All_food_list')
    .collection(HomeController().category.value);

class HomeController extends GetxController{
    RxInt currentIndex  = 0.obs;
    List getData = [];

    bool changeFavouriteValue = false;
    RxInt changeQuantity = 1.obs;
    RxString category = 'All'.obs;
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

    updateData({required int index, required bool changeFavData}) async {
      var docSnap = await collection.get();
      var docId = docSnap.docs;
      return collection
          .doc(docId[index].id)
         .update({'favourite' : changeFavData})
          .then((value) => print("User Update") )
          .catchError((error) => print("Error $error"));

    }

    updateQuantity({required int index, required int changeQuantity}) async {
      var docSnap = await collection.get();
      var docId = docSnap.docs;
      return collection
          .doc(docId[index].id)
          .update({'quantity' : changeQuantity})
          .then((value) => print("User Update") )
          .catchError((error) => print("Error $error"));

    }


}