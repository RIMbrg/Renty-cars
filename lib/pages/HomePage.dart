import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:renty_cars/models/car.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';
import 'package:renty_cars/widgets/MyAppBar2.dart';
import 'package:renty_cars/widgets/constants.dart';
import 'package:renty_cars/widgets/navbar.dart';
import 'package:renty_cars/widgets/SearchField.dart';
import 'package:renty_cars/widgets/SelectCategory.dart';
import 'package:renty_cars/widgets/SuggestionList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: tWhiteColor,
      appBar: const MyAppBar2(
        pageTitle: "Airoport Paris CDG, Paris",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            SearchField(),
            SelectCategory(),
            SizedBox(height: 20.0),
            SuggestionList("Recommendation for you", Car.recommendation),
            SizedBox(height: 20.0),
            // SuggestionList("Nearby you", Car.nearby)
          ]),
        ),
      ),
      // bottomNavigationBar: NavBarPage(),

      // bottomNavigationBar: BottomNavigationBar(
      //     elevation: 0.0,
      //     backgroundColor: Colors.white,
      //     selectedItemColor: Colors.blue.shade600,
      //     unselectedItemColor: Colors.grey.shade600,
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.favorite), label: 'favorite'),
      //       BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.message_outlined), label: 'messages'),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
      //     ]),
    );
  }
}
