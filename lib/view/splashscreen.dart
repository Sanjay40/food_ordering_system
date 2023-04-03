import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_ordering_system/controller/getx_controller.dart';
import 'package:food_ordering_system/view/homescreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0A0A),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back.png'),
            fit: BoxFit.cover
          ),
          //color: Colors.white.withOpacity(0.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: SafeArea(
            child: GetBuilder(
              init: HomeController(),
              builder: (HomeController controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        DelayedDisplay(
                          delay: Duration(seconds: 1),
                          child: Padding(
                            padding: EdgeInsets.only(left : 30 ,bottom: 40,right: 80),
                            child: Image(image: AssetImage("images/spp33.png"),width: 140,),
                          ),
                        ),
                        DelayedDisplay(
                          delay: Duration(seconds: 1),
                          child: Padding(
                            padding: EdgeInsets.only(top: 60,right: 0),
                            child: Image(image: AssetImage("images/spp22.png"),width: 140,),
                          ),
                        ),
                      ],
                    ),
                    const DelayedDisplay(
                      delay: Duration(seconds: 2),
                      child: Padding(
                        padding: EdgeInsets.only(left: 100,top: 30),
                        child: Image(image: AssetImage("images/spp11.png"),width: 200,),
                      ),
                    ),
                    Row(
                      children: const [
                        DelayedDisplay(
                          delay: Duration(seconds: 3),
                          child: Padding(
                            padding: EdgeInsets.only(left : 30 ,top: 60,right: 80),
                            child: Image(image: AssetImage("images/spp44.png"),width: 140,),
                          ),
                        ),
                        DelayedDisplay(
                          delay: Duration(seconds: 3),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 70,top: 40),
                            child: Image(image: AssetImage("images/spp55.png"),width: 140,),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DelayedDisplay(
                            delay: const Duration(seconds: 4),
                            child: Text("Order delicious\nfood now..",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.off(() => const HomeScreen()),
                            child: DelayedDisplay(
                              delay: const Duration(seconds: 4),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: const Icon(Icons.arrow_forward_outlined,
                                color: Color(0xff0A0A0A),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      )
    );
  }
}
