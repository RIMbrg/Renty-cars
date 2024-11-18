import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          categoryButton(Icons.car_rental, 'Cars'),
          categoryButton(Icons.car_repair, 'Trucks'),
          categoryButton(Icons.fire_truck, 'Van'),
          categoryButton(Icons.fire_truck, 'Van'),
        ],
      ),
    );
  }
}

Widget categoryButton(IconData icon, String? text) {
  return Container(
    margin: EdgeInsets.all(18.0),
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade100)),
    child: InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: Color(0xff2972ff),
          ),
          Text("$text"),
        ],
      ),
    ),
  );
}
