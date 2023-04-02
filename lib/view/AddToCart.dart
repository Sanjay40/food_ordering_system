import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
                        child: const Image(
                          image: AssetImage('images/spp11.png'),
                          height: 60,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15,top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                                        child: Icon(Icons.remove,
                                          size: 15,
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Text("\$ ${homeController.getData[index]['price'] * homeController.getData[index]['quantity']}",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5
                              ),
                            ),
                            // Text("\$ ${homeController.AddToCart[index]['foodPrice']}",
                            //   style: GoogleFonts.poppins(
                            //       fontSize: 19,
                            //       fontWeight: FontWeight.w600,
                            //       letterSpacing: 0.5
                            //   ),
                            // ),
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
