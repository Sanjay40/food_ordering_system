import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/getx_controller.dart';
import '../utils/Global.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({Key? key}) : super(key: key);

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor:Colors.grey.shade100,
          elevation: 0,
          centerTitle: true,
          title: Text("AddToCart",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Variable.myClr,
            ),
          ),
        ),
        body: Obx(()=> ListView.builder(
          itemCount: homeController.AddToCart.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Image(
                          image: NetworkImage("${homeController.AddToCart[index]['image']}"),
                          height: 60,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 250,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${homeController.AddToCart[index]['name']}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          homeController.AddToCart.remove(homeController.AddToCart[index]);
                                        },
                                        child: const Icon(Icons.remove,
                                          size: 15,
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15,),
                            // Text("\$ ${homeController.AddToCart[index]['price'] * homeController.AddToCart[index]['quantity']}",
                            //   style: GoogleFonts.poppins(
                            //       fontSize: 15,
                            //       fontWeight: FontWeight.w600,
                            //       letterSpacing: 0.5
                            //   ),
                            // ),
                            Text("\$ ${homeController.AddToCart[index]['price']}",
                              style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ) ;
          },
        ),)
    );
  }
}
