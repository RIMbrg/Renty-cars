// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:renty_cars/pages/Home.dart';
import 'package:renty_cars/pages/HomePage.dart';
import 'package:renty_cars/pages/OnboardingPage.dart';
import 'package:renty_cars/pages/ProfilePage.dart';
import 'package:renty_cars/pages/SignUp.dart';
import 'package:renty_cars/pages/login.dart';


class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  @override
  void initState() {
    pageList.add(HomePage(idx: 1,));
    pageList.add(ProfilePage());
     // pageList.add(LoginPage());
    // pageList.add(Home());
    // pageList.add(SignUpPage());
    super.initState();
  }

  int _currentIndex = 0;
  List<Widget> pageList = [];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 6,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          
             BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Reservation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
         
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}