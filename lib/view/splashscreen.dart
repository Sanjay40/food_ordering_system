import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0A0A),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back.png'),
            fit: BoxFit.cover
          ),
          //color: Colors.white.withOpacity(0.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DelayedDisplay(
                      delay: Duration(seconds: 1),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,top: 0,),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("images/s1.png"),
                          //child: Image(image: AssetImage("images/s1.png"),height: 120,),
                        ),
                      ),
                    ),
                    DelayedDisplay(
                      delay: Duration(seconds: 1),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 80,top: 90),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("images/s2.png"),
                          //child: Image(image: AssetImage("images/s2.png"),height: 120,),
                        ),
                      ),
                    ),
                  ],
                ),
                DelayedDisplay(
                  delay: Duration(seconds: 2),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 120,top: 40),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("images/s4.png"),
                      //child: Image(image: AssetImage("images/s3.png"),height: 120,),
                    ),
                  ),
                ),
                Row(
                  children: [
                    DelayedDisplay(
                      delay: Duration(seconds: 3),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,top: 70),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("images/s5.png"),
                          //child: Image(image: AssetImage("images/s5.png"),height: 120,),
                          //child: Image(image: AssetImage("images/s5.png"),height: 120,),
                        ),
                      ),
                    ),
                    DelayedDisplay(
                      delay: Duration(seconds: 3),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 80,top: 0),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("images/s6.png"),
                          //child: Image(image: AssetImage("images/splash.png"),height: 120,),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DelayedDisplay(
                        delay: Duration(seconds: 4),
                        child: Text("Order delicious\nfood now..",
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w700
                        ),
                        ),
                      ),
                      DelayedDisplay(
                        delay: Duration(seconds: 4),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_forward_outlined,
                          color: Color(0xff0A0A0A),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
