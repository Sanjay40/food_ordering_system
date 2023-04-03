import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/getx_controller.dart';
import '../utils/Global.dart';

class DetailsScreen extends StatefulWidget {
  //const DetailsScreen({Key? key}) : super(key: key);
  int index;
  QueryDocumentSnapshot data;
  DetailsScreen({super.key, required this.data,required this.index});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  HomeController homeController = Get.put(HomeController());
  @override
  void initState(){
    super.initState();
    print("daaaaa ${widget.data['quantity']}");
    //homeController.totalPrice = homeController.getData[widget.index]['foodPrice'];
  }

  @override
  Widget build(BuildContext context) {
    //int index = Get.arguments;
    //print(index);
    //homeController.changeFavouriteValue.value = widget.data['favourite'];
    homeController.changeQuantity.value = widget.data['quantity'];
    return Scaffold(

      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor:Colors.grey.shade100,
        elevation: 0,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20,top: 10),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back,
                color: Variable.myClr,
                size:25,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text("Details ",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Variable.myClr,
          ),
        ),
        actions: [
          // Padding(
          //     padding: const EdgeInsets.only(right: 14),
          //     child: CircleAvatar(
          //       backgroundColor: Colors.white,
          //       child: IconButton(
          //         icon: (widget.data[widget.index]['favourite']) ? const Icon(Icons.favorite_outlined,
          //           color: Colors.red,
          //           size:23,
          //         ) :  Icon(Icons.favorite_outline,
          //           color: Variable.myClr,
          //           size:23,
          //         ),
          //         onPressed: ()=> homeController.updateData(index: widget.index, changeFavData: widget.data[widget.index]['favourite']),
          //         // onPressed: (){
          //
          //         //widget.data['favourite'] =   widget.data['favourite'];
          //         //homeController.changeFavouriteData();
          //         //print("hello data ${homeController.changeFavouriteValue.value}");
          //         //widget.data = homeController.changeFavouriteValue.value;
          //         //homeController.updateData(index: widget.index, changeFavData: homeController.changeFavouriteValue.value );
          //         //print("index : ${widget.index}");
          //         //homeController.changeFavouriteValue = snapShot.data!.docs[widget.index]['foodFavourite'];
          //         // if(widget.data['favourite'] == false){
          //         //   homeController.changeFavouriteValue = true;
          //         // }
          //         // else
          //         //   {
          //         //     homeController.changeFavouriteValue = false;
          //         //   }
          //         // homeController.updateData(index: widget.index, changeFavData: homeController.changeFavouriteValue);
          //         // homeController.changeFavouriteValue = snapShot.data!.docs[widget.index!]['foodFavourite'];
          //         // if(snapShot.data!.docs[widget.index!]['foodFavourite'] == false){
          //         //   //homeController.changeFavouriteValue = true;
          //         //   homeController.changeFavouriteValue = true;
          //         // }
          //         // else
          //         //   {
          //         //     homeController.changeFavouriteValue = false;
          //         //     //homeController.getData[widget.index!]['foodFavourite'] = ("foodFavourite", false);
          //         //     //homeController.changeFavouriteValue = false;
          //         //   }
          //         // homeController.updateData(index: widget.index!, changeFavData: homeController.changeFavouriteValue);
          //         //snapShort.data!.docs[widget.index!]['foodFavourite'] = !snapShort.data!.docs[widget.index!]['foodFavourite'];
          //         // if(homeController.getData[widget.index!]['foodFavourite'] == false)
          //         // {
          //         //   //controller.getData[widget.index!]['foodFavourite'] = true;
          //         //   //controller.changeFavouriteValue = true;
          //         //   homeController.getData[widget.index!]['foodFavourite'] = true;
          //         //   //snapShort.data!.docs[widget.index!]['foodFavourite'] = !snapShort.data!.docs[widget.index!]['foodFavourite'];
          //         // }
          //         // else
          //         // {
          //         //   homeController.getData[widget.index!]['foodFavourite'] = false;
          //         //   //snapShort.data!.docs[widget.index!]['foodFavourite'] = false;
          //         // }
          //         // homeController.updateData(index: widget.index!, changeFavData:
          //         // homeController.getData[widget.index!]['foodFavourite']);
          //         //print(homeController.getData[widget.index!]['foodFavourite']);
          //         // controller.getData[widget.index!]['foodFavourite'] =
          //         // !controller.getData[widget.index!]['foodFavourite'];
          //
          //         // if(controller.getData[widget.index!]['foodFavourite'])
          //         //   {
          //         //     controller.getData[widget.index!]['foodFavourite'] = false;
          //         //   }
          //         // else
          //         //   {
          //         //     controller.getData[widget.index!]['foodFavourite'] = true;
          //         //   }
          //
          //         //print( controller.getData[widget.index!]['foodFavourite'] = !controller.getData[widget.index!]['foodFavourite']);
          //         //},
          //       ),
          //     )
          // )
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Order_food_list')
                .doc('All_food_list')
                .collection(homeController.category.value)
                .snapshots(),
            builder: (context,snapShot){
              if(snapShot.hasError){
                print("hase Error");
              }
              else if(snapShot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else{
                return Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: (widget.data['favourite']) ? Icon(
                          Icons.favorite_outlined,
                          color: Colors.red,
                          size:23,
                        ) :  Icon(Icons.favorite_outline,
                          color: Variable.myClr,
                          size:23,
                        ),
                        //onPressed: () => homeController.updateData(index: widget.index, changeFavData: widget.data['favourite']),
                        // onPressed: (){

                        //widget.data['favourite'] =   widget.data['favourite'];
                        //homeController.changeFavouriteData();
                        //print("hello data ${homeController.changeFavouriteValue.value}");
                        //widget.data = homeController.changeFavouriteValue.value;
                        //homeController.updateData(index: widget.index, changeFavData: homeController.changeFavouriteValue.value );
                        //print("index : ${widget.index}");
                        //homeController.changeFavouriteValue = snapShot.data!.docs[widget.index]['foodFavourite'];
                        // if(widget.data['favourite'] == false){
                        //   homeController.changeFavouriteValue = true;
                        // }
                        // else
                        //   {
                        //     homeController.changeFavouriteValue = false;
                        //   }
                        // homeController.updateData(index: widget.index, changeFavData: homeController.changeFavouriteValue);
                        // homeController.changeFavouriteValue = snapShot.data!.docs[widget.index!]['foodFavourite'];
                        // if(snapShot.data!.docs[widget.index!]['foodFavourite'] == false){
                        //   //homeController.changeFavouriteValue = true;
                        //   homeController.changeFavouriteValue = true;
                        // }
                        // else
                        //   {
                        //     homeController.changeFavouriteValue = false;
                        //     //homeController.getData[widget.index!]['foodFavourite'] = ("foodFavourite", false);
                        //     //homeController.changeFavouriteValue = false;
                        //   }
                        // homeController.updateData(index: widget.index!, changeFavData: homeController.changeFavouriteValue);
                        //snapShort.data!.docs[widget.index!]['foodFavourite'] = !snapShort.data!.docs[widget.index!]['foodFavourite'];
                        // if(homeController.getData[widget.index!]['foodFavourite'] == false)
                        // {
                        //   //controller.getData[widget.index!]['foodFavourite'] = true;
                        //   //controller.changeFavouriteValue = true;
                        //   homeController.getData[widget.index!]['foodFavourite'] = true;
                        //   //snapShort.data!.docs[widget.index!]['foodFavourite'] = !snapShort.data!.docs[widget.index!]['foodFavourite'];
                        // }
                        // else
                        // {
                        //   homeController.getData[widget.index!]['foodFavourite'] = false;
                        //   //snapShort.data!.docs[widget.index!]['foodFavourite'] = false;
                        // }
                        // homeController.updateData(index: widget.index!, changeFavData:
                        // homeController.getData[widget.index!]['foodFavourite']);
                        //print(homeController.getData[widget.index!]['foodFavourite']);
                        // controller.getData[widget.index!]['foodFavourite'] =
                        // !controller.getData[widget.index!]['foodFavourite'];

                        // if(controller.getData[widget.index!]['foodFavourite'])
                        //   {
                        //     controller.getData[widget.index!]['foodFavourite'] = false;
                        //   }
                        // else
                        //   {
                        //     controller.getData[widget.index!]['foodFavourite'] = true;
                        //   }

                        //print( controller.getData[widget.index!]['foodFavourite'] = !controller.getData[widget.index!]['foodFavourite']);
                        //},
                      ),
                    //)
                );
              }
              return Container();
            },
          )
        ],
      ),
      body: Obx(()=>  Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35,),
            Center(
              child: Image(
                image: NetworkImage("${widget.data['image']}"),
                height: 250,
              ),
            ),
            const SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.data['name'] }",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Variable.myClr,
                      letterSpacing: 0.5
                  ),
                ),
                Text(
                  "⭐  ${widget.data['rating']}",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade400),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 35,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  alignment: Alignment.center,
                  child: Text("🩸 100 Kcal",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                        fontSize: 14
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  alignment: Alignment.center,
                  child: Text("🥚 100 Ptn",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                        fontSize: 14
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  alignment: Alignment.center,
                  child: Text("☘ 100 Org",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                        fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${widget.data['price']}",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Variable.myClr,
                      letterSpacing: 0.5
                  ),
                ),
                Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Variable.myClr,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon : const Icon(Icons.remove,
                          size: 20,
                        ),
                        color: Variable.myClr,
                        onPressed: (){
                          //homeController.changeQuantity.value = widget.data['quantity'];
                          //homeController.changeDecrementQuantity();
                          homeController.updateDecQuantity(id: widget.data.id, changeQuantity: homeController.changeQuantity.value);
                        },
                      ),
                      Text("${homeController.changeQuantity.value}",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      IconButton(
                        icon : const Icon(Icons.add,
                          size: 20,
                        ),
                        color: Variable.myClr,
                        onPressed: (){
                          //homeController.changeQuantity.value = widget.data['quantity'];
                          //homeController.changeIncrementQuantity();
                          print("dddddd ${widget.data['quantity']}");
                          homeController.updateIncQuantity(id: widget.data.id, changeQuantity: homeController.changeQuantity.value);
                          //print(controller.getData[widget.index]['foodQuantity']);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ), ////////////// error line
            const SizedBox(height: 15,),
            Text("About ${widget.data['name']}",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Variable.myClr,
                  letterSpacing: 0.5
              ),
            ),
            const SizedBox(height: 5,),
            Text("${widget.data['description']}",
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 10,
                        offset: const Offset(1,4)
                    ),
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40,right: 20,top: 20,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\$ ${widget.data['price'] * homeController.changeQuantity.value}",
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Variable.myClr,
                              letterSpacing: 1
                          ),
                        ),
                        Text("Total Price",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Variable.myClr,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        print("data ${widget.data['quantity']}");
                        ///homeController.totalPrice = snapShot.data!.docs[widget.index]['foodPrice'] * snapShot.data!.docs[widget.index]['foodQuantity'];
                        homeController.AddToCart.add(widget.data);
                        //print("data222 ${homeController.AddToCart[widget.index]['quantity']}");

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Added Item",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        //print(homeController.AddToCart);
                      },
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Variable.myClr,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text("Add To Cart",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ))
    );
  }
}