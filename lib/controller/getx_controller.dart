import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_system/view/AddToCart.dart';
import 'package:food_ordering_system/view/favourite.dart';
import 'package:get/get.dart';

//
// CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
//     .doc('All_food_list')
//     .collection(HomeController().category.value);
class HomeController extends GetxController{

    RxInt currentIndex  = 0.obs;
    pageIndex(int val) {
      currentIndex.value = val;
      update();
    }
    List getData = [];
    static HomeController homeController = Get.put(HomeController());
    CollectionReference collection = FirebaseFirestore.instance.collection('Order_list');
    // CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
    //     .doc('All_food_list')
    //     .collection(homeController.category.value);
    RxBool changeFavouriteValue = false.obs;
    RxInt changeQuantity = 1.obs;
    RxString category = 'Food'.obs;
    final searchText = ValueNotifier("");
    RxList AddToCart = [].obs;
    // tabIndex(int val){
    //   currentIndex.value  = val;
    //   if(currentIndex.value == 1){
    //     Get.to(() => const FavouriteScreen());
    //   }
    //   else if(currentIndex.value == 2){
    //     Get.to(() => const AddToCartScreen());
    //   }
    // }

    // changeFavouriteData(){
    //   changeFavouriteValue.value = !changeFavouriteValue.value;
    //   update();
    // }
    //
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


    updateData({required String index, required bool changeFavData}) async {
      // CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
      //     .doc('All_food_list')
      //     .collection(homeController.category.value);
      // CollectionReference collection = FirebaseFirestore.instance.collection('Order_list')
      //     .where('category',isEqualTo :homeController.category.value);

       //QuerySnapshot data = await collection.where('category',isEqualTo :homeController.category.value).get();

       // Stream<QuerySnapshot<Map<String, dynamic>>> collection = FirebaseFirestore.instance.collection('Order_list')
      //     .where('category',isEqualTo :homeController.category.value).snapshots();
      print("object $changeFavData");
      var docSnap = await collection.get();
      //var docId = docSnap.docs;
      return collection
          .doc(index)
         .update({'favourite' : !changeFavData})
          .then((value) => print("User Update") )
          .catchError((error) => print("Error $error"));

    }

    updateIncQuantity({required String id, required int changeQuantity}) async {
      changeIncrementQuantity();
      // if(changeQuantity > 1)
      // {
      //   changeQuantity --;
      // }
      // else{
      //   changeQuantity = 1;
      // }
     // update();
      // CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
      //     .doc('All_food_list')
      //     .collection(homeController.category.value);
      // CollectionReference collection = FirebaseFirestore.instance.collection('Order_list');
      var docSnap = await collection.get();
      //var docId = docSnap.docs;
      return collection
          .doc(id)
          .update({'quantity' : changeQuantity})
          .then((value) => print("User Update") )
          .catchError((error) => print("Error $error"));

    }

    updateDecQuantity({required String id, required int changeQuantity}) async {
      changeDecrementQuantity();
      // if(changeQuantity >= 1)
      // {
      //   changeQuantity++;
      // }
      //update();
      // CollectionReference collection = FirebaseFirestore.instance .collection('Order_food_list')
      //     .doc('All_food_list')
      //     .collection(homeController.category.value);
      //CollectionReference collection = FirebaseFirestore.instance.collection('Order_list');
      var docSnap = await collection.get();
      //var docId = docSnap.docs;
      return collection
          .doc(id)
          .update({'quantity' : changeQuantity})
          .then((value) => print("User Update") )
          .catchError((error) => print("Error $error"));

    }


}