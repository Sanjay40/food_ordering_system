import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/getx_controller.dart';
import '../utils/Global.dart';

class DetailsScreen extends StatefulWidget {
  //const DetailsScreen({Key? key}) : super(key: key);
  int? index;
  DetailsScreen({super.key, required this.index});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    //int index = Get.arguments;
    //print(index);
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
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite_border,
                color: Variable.myClr,
                size:23,
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) {
          return Column(
            children: [
              SizedBox(height: 35,),
              Center(
                child: Image(
                    image: AssetImage('images/spp11.png'),
                  height: 200,
                ),
              ),
              SizedBox(height: 35,),
              Text("${controller.getData[widget.index!]['foodName']}",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Variable.myClr,
                ),
              )
            ],
          );
        }
      ),
    );
  }
}