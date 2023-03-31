import 'package:flutter/material.dart';
import 'package:food_ordering_system/view/splashscreen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}