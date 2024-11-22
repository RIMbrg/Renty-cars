// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
// import 'package:renty_cars/pages/Favorite/FavoriteMain.dart';
import 'package:renty_cars/pages/Favorite/FavoriteProvider.dart';
import 'package:renty_cars/pages/HomePage.dart';

import 'package:renty_cars/pages/LoginPage.dart';
import 'package:renty_cars/pages/OnboardingPage.dart';
import 'package:renty_cars/pages/SignUpPage.dart';
import 'package:renty_cars/pages/TestCode/DetailsScreen.dart';
import 'package:renty_cars/pages/TestCode/HomeScreen.dart';
import 'package:renty_cars/widgets/NavBar.dart';
import 'package:renty_cars/widgets/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: " AIzaSyA4ingBZbmm5SHq_D24MGTK6uVi0-hQXf0",
          appId: "",
          projectId: "renty-cars-44720",
          messagingSenderId: ''));
  //**************Modified by Asma */
  // *************The provider of the favorite page
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: MyApp(),
    ),
  );

  //******************* */

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RENTY-CARS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: tAccentColor),
        useMaterial3: true,
      ),

      home: OnboardingPage(),
      // home: FirebaseAuth.instance.currentUser == null ? Login() : Home(),
      routes: {
        "signup": (context) => SignUpPage(),
        "login": (context) => LoginPage(),
        "home": (context) => HomePage(),
        "navbar": (context) => NavBarPage(),
      },
    );
  }
}
