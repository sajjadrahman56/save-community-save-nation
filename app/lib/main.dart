import 'dart:math';

import 'package:app/Services/email_verify/forgate_password/forgatePassword.dart';
import 'package:app/app/profile-pages/liveChatADH/livechat.dart';
import 'package:app/login_reg/login.dart';
import 'package:app/login_reg/registration.dart';
import 'package:app/pages/splash.dart';
import 'package:app/profilepage/profile.dart';

import 'package:app/user_distance/UserDistanceSylhet/UserDistanceSylSadar/user_distance_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Apps/routes/app_pages.dart';
import 'Apps/routes/app_routes.dart';
import 'app/profile-pages/six_profile_page.dart';
import 'new_volunteer/volunteer.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  //print(FirebaseAuth.instance.currentUser!);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Save Community',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashS(),
      //initialRoute: AppRoutes.SPLASHA,
      routes: AppPages.routes,
    );
  }
}
 //hello man