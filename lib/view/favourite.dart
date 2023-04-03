import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/getx_controller.dart';
import '../utils/Global.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
        title: Text("Favourite",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Variable.myClr,
          ),
        ),
      ),
      body: GetBuilder(
        init: HomeController(),
        builder: (HomeController controller){
          return ListView.builder(
            itemCount: controller.getData.length,
            itemBuilder: (context,index){
              return (controller.getData[index]['favourite'] == true) ? Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
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
                            image: NetworkImage("${controller.getData[index]['image']}"),
                            height: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${controller.getData[index]['name']}",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(height: 15,),
                              Text("\$ ${controller.getData[index]['price']}",
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
              ) : Container();
            },
          );
        },
      )
    );
  }
}
