import 'package:flutter/material.dart';
import 'package:renty_cars/pages/detail_page/Car_List_Page.dart';
import 'package:renty_cars/pages/detail_page/car_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarListPage(),
    );
  }
}
