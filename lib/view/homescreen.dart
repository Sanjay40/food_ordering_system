import 'package:flutter/material.dart';
import 'package:food_ordering_system/controller/getx_controller.dart';
import 'package:food_ordering_system/utils/Global.dart';
import 'package:food_ordering_system/view/DetailsScreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.gamepad_outlined,
              color: Variable.myClr,
              size: 25,
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Location",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade400,
                  fontSize: 12),
            ),
            Text(
              "📍 Singapura",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Variable.myClr,
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.notifications_active_outlined,
                color: Variable.myClr,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('carosoul_slider')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print("Data is error");
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CarouselSlider.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index, pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(
                            "${snapshot.data!.docs[index]['crsImage']}"),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    initialPage: 0,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                onChanged: (val) {
                  homeController.searchText.value = val;
                },
                decoration: InputDecoration(
                  hintText: "Search Your Food...",
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, color: Colors.grey.shade300),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.search,
                      color: Variable.myClr,
                      size: 25,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 2)),
                ),
                style: GoogleFonts.poppins(
                    color: Variable.myClr,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Category Food",
                  style: GoogleFonts.poppins(
                    color: Variable.myClr,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        homeController.category.value = 'All';
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: (homeController.category.value == 'All')
                              ? Variable.myClr
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "All",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: (homeController.category.value == 'All')
                                  ? Colors.white
                                  : Variable.myClr),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        homeController.category.value = 'Food';
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: (homeController.category.value == 'Food')
                              ? Variable.myClr
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Food",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: (homeController.category.value == 'Food')
                                  ? Colors.white
                                  : Variable.myClr),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        homeController.category.value = 'Fruits';
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: (homeController.category.value == 'Fruits')
                              ? Variable.myClr
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Fruits",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color: (homeController.category.value == 'Fruits')
                                  ? Colors.white
                                  : Variable.myClr),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        homeController.category.value = 'Vegetables';
                      },
                      child: Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                          color: (homeController.category.value == 'Vegetables')
                              ? Variable.myClr
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Vegetables",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              color:
                                  (homeController.category.value == 'Vegetables')
                                      ? Colors.white
                                      : Variable.myClr),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Popular Food",
                  style: GoogleFonts.poppins(
                    color: Variable.myClr,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Order_food_list')
                    .doc('All_food_list')
                    .collection(homeController.category.value)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("Data is error");
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Expanded(
                      // height: Get.height,
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                      itemBuilder: (context, index) {
                        homeController.getData = snapshot.data!.docs;
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, right: 15),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "⭐  ${snapshot.data!.docs[index]['rating']}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade400),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Center(
                                    child: Image(
                                      image: AssetImage('images/spp11.png'),
                                      height: 100,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Text(
                                      "${snapshot.data!.docs[index]['name']}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Variable.myClr),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 5, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                          //Text("${snapshot.data!.docs.length - 1}"),
                                        Text(
                                          "\$ ${snapshot.data!.docs[index]['price']}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Variable.myClr),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() =>
                                                DetailsScreen(data: snapshot.data!.docs[index]));
                                            print("hello ${snapshot.data!.docs[index]}");
                                          },
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Variable.myClr,
                                            child: const Icon(
                                              Icons
                                                  .shopping_cart_checkout_outlined,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                      },
                    ),
                  ));
                }
                //},
                ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: homeController.currentIndex.value,
            onTap: homeController.tabIndex,
            selectedItemColor: Variable.myClr,
            unselectedItemColor: Colors.grey.shade400,
            selectedLabelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w700, color: Variable.myClr),
            unselectedLabelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w700, color: Variable.myClr),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                    size: 25,
                  ),
                  label: 'favourite'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                  ),
                  label: 'cart'),
            ],
          )),
    );
  }
}

// GridView.count(
// scrollDirection: Axis.vertical,
// //physics: NeverScrollableScrollPhysics(),
// crossAxisCount: 2,
// childAspectRatio: 1/1.3,
// children: snapshot.data!.docs.map((e){
// controller.getData = snapshot.data!.docs;
// print("data ${controller.getData}");
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(10),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(top: 15,right: 15),
// child: Align(
// alignment: Alignment.topRight,
// child: Text("⭐  ${e['foodRating']}",
// style: GoogleFonts.poppins(
// fontSize: 12,
// fontWeight: FontWeight.w600,
// color: Colors.grey.shade400
// ),
// ),
// ),
// ),
// SizedBox(height: 10,),
// Center(
// child: Image(image: AssetImage('images/spp11.png'),
// height: 100,
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 20,top: 10),
// child: Text("${e['foodName']}",
// style: GoogleFonts.poppins(
// fontSize: 18,
// fontWeight: FontWeight.w700,
// color: Variable.myClr
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 20,top : 5 ,right: 15),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// //Text("${snapshot.data!.docs.length - 1}"),
// Text("\$ ${e['foodPrice']}",
// style: GoogleFonts.poppins(
// fontSize: 18,
// fontWeight: FontWeight.w600,
// color: Variable.myClr
// ),
// ),
// GestureDetector(
// onTap: () => Get.to(() =>
// DetailsScreen(index: snapshot.data!.docs.indexOf(e),)),
// child: CircleAvatar(
// radius: 18,
// backgroundColor: Variable.myClr,
// child: Icon(Icons.shopping_cart_checkout_outlined,
// color: Colors.white,
// size: 15,
// ),
// ),
// )
// ],
// ),
// )
//
// ],
// ),
// ),
// );
// }).toList(),
// ),

// StreamBuilder(
// stream: FirebaseFirestore.instance
//     .collection('Food_list')
//     .snapshots(),
// builder: (context, snapshot) {
// if (snapshot.hasError) {
// print("Data is error");
// } else if (snapshot.connectionState ==
// ConnectionState.waiting) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// }
// return Expanded(
// // height: Get.height,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: GridView.builder(
// itemCount: snapshot.data!.docs.length,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2, childAspectRatio: 1 / 1.3),
// itemBuilder: (context, index) {
// homeController.getData = snapshot.data!.docs;
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// height: 250,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(10),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(
// top: 15, right: 15),
// child: Align(
// alignment: Alignment.topRight,
// child: Text(
// "⭐  ${snapshot.data!.docs[index]['foodRating']}",
// style: GoogleFonts.poppins(
// fontSize: 12,
// fontWeight: FontWeight.w600,
// color: Colors.grey.shade400),
// ),
// ),
// ),
// const SizedBox(
// height: 10,
// ),
// const Center(
// child: Image(
// image: AssetImage('images/spp11.png'),
// height: 100,
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(
// left: 20, top: 10),
// child: Text(
// "${snapshot.data!.docs[index]['foodName']}",
// style: GoogleFonts.poppins(
// fontSize: 18,
// fontWeight: FontWeight.w700,
// color: Variable.myClr),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(
// left: 20, top: 5, right: 15),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// //Text("${snapshot.data!.docs.length - 1}"),
// Text(
// "\$ ${snapshot.data!.docs[index]['foodPrice']}",
// style: GoogleFonts.poppins(
// fontSize: 18,
// fontWeight: FontWeight.w600,
// color: Variable.myClr),
// ),
// GestureDetector(
// onTap: () =>
// Get.to(() => DetailsScreen(index: index)),
// child: CircleAvatar(
// radius: 18,
// backgroundColor: Variable.myClr,
// child: const Icon(
// Icons
//     .shopping_cart_checkout_outlined,
// color: Colors.white,
// size: 15,
// ),
// ),
// )
// ],
// ),
// )
// ],
// ),
// ));
// },
// ),
// ),
// );
// },
// ),
