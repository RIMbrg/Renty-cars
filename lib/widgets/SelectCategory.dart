import 'package:flutter/material.dart';
import 'package:renty_cars/widgets/constants.dart';

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
          categoryButton(Icons.car_rental, 'Mercedes'),
          categoryButton(Icons.car_rental, 'BMW'),
          categoryButton(Icons.car_rental, 'KIA'),
          categoryButton(Icons.car_rental, 'Peugeot'),
          categoryButton(Icons.car_rental, 'KIA'),
          // categoryButton(Icons.fire_truck, 'Van'),
        ],
      ),
    );
  }
}

Widget categoryButton(IconData icon, String? text) {
  return Container(
    margin: const EdgeInsets.all(18.0),
    width: 70.0,
    height: 50.0,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(10)),
    child: InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: tAccentColor,
          ),
          Text("$text"),
        ],
      ),
    ),
  );
}
