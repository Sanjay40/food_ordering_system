
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          return StreamBuilder(
              stream:FirebaseFirestore.instance.collection('Order_list').snapshots(),
              builder: (context,snapshot){
                 if(snapshot.hasError) {
                    return const Center(child: Text("Something went Wrong!!"),);
                   } else if(snapshot.connectionState == ConnectionState.waiting) {
                   return const Center(child: CircularProgressIndicator());
                 } else {
                       return ListView.builder(
                     itemCount: snapshot.data!.docs.length,
                     itemBuilder: (context,index){
                       List data = snapshot.data!.docs;
                       return (data[index]['favourite']) ? Padding(
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
                                     image: NetworkImage("${data[index]['image']}"),
                                     height: 50,
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 15,top: 20),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("${data[index]['name']}",
                                         style: GoogleFonts.poppins(
                                             fontSize: 18,
                                             fontWeight: FontWeight.w600
                                         ),
                                       ),
                                       const SizedBox(height: 15,),
                                       Text("\$ ${data[index]['price']}",
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
                 }
          });
        },
      )
    );
  }
}
