// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:renty_cars/pages/CarDetailsPage.dart';
import 'package:renty_cars/pages/FavoriteProvider/FavoritePage.dart';
import 'package:renty_cars/pages/HomePage.dart';
import 'package:renty_cars/pages/Login.dart';
import 'package:renty_cars/pages/OnboardingPage.dart';
import 'package:renty_cars/pages/ProfilePage.dart';
import 'package:renty_cars/pages/SignUp.dart';
import 'package:renty_cars/pages/TestCode/HomeScreen.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  @override
  void initState() {
    // pageList.add(OnboardingPage());
    // pageList.add(SignUp());
    // // pageList.add(SignUpPage());
    // pageList.add(Login());
    // // pageList.add(LoginPage());

    pageList.add(HomePage());
    pageList.add(HomeScreen());

    pageList.add(FavoritesPage());
    pageList.add(ProfilePage());

    // pageList.add();
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
            icon: Icon(Icons.handshake),
            label: 'Onboarding',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.system_security_update_good_rounded),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home2',
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
            icon: Icon(Icons.calendar_today),
            label: 'Reservations',
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
