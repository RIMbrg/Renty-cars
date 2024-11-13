// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:renty_cars/pages/Home.dart';
import 'package:renty_cars/pages/Login.dart';
import 'package:renty_cars/pages/SignUp.dart';
import 'package:renty_cars/pages/detail_page/Car_List_Page.dart';
import 'package:renty_cars/pages/detail_page/DetailPageView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: " AIzaSyA4ingBZbmm5SHq_D24MGTK6uVi0-hQXf0",
          appId: "",
          projectId: "renty-cars-44720",
          messagingSenderId: ''));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RENTY-CARS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CarListPage(),
      // home: FirebaseAuth.instance.currentUser == null ? Login() : Home(),
      routes: {
        "signup": (context) => SignUp(),
        "login": (context) => Login(),
        "home": (context) => Home(),
      },
    );
  }
}
