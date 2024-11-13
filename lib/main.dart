
// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:renty_cars/pages/OptionPage.dart';
import 'package:renty_cars/widgets/NavBar.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options:const FirebaseOptions(apiKey:" AIzaSyA4ingBZbmm5SHq_D24MGTK6uVi0-hQXf0", appId:"", projectId: "renty-cars-44720", messagingSenderId: '')
  );
    
  
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
    home:RentalCarScreen(),
    // const NavBarPage(),
      );
    
    
  }

}
