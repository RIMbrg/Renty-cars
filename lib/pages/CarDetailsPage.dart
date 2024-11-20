// ignore: file_names
import 'package:flutter/material.dart';

import 'package:renty_cars/models/Car.dart';
import 'package:renty_cars/pages/TestCode/Bottom.dart';
import 'package:renty_cars/pages/TestCode/CarModel.dart';
import 'package:renty_cars/pages/TestCode/size_config.dart';
import 'package:renty_cars/widgets/ButtonFavorite.dart';
import 'package:renty_cars/widgets/constants.dart';

class CarDetailsPage extends StatefulWidget {
  CarDetailsPage(this.car, {Key? key}) : super(key: key);
  Car car;

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//
//
//
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        title: Text(
          widget.car.name!,
          style: const TextStyle(color: Colors.black),
        ),
      ),
//
//
//
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            //
            //
            Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                      image: AssetImage(widget.car.carImageUrl!),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10.0),
            //
            //
            //
            Text(
              widget.car.carDescription!,
              style: TextStyle(
                color: Colors.blue.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            //
            //
            //

            Text(
              widget.car.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
            //
            //
            //
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                Text(
                  widget.car.carLocation!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            const SizedBox(height: 10.0),
            //
            //
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.car.rentalPrice}\$/Month",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22.0),
                  overflow: TextOverflow.ellipsis,
                ),
                ButtonFavorite(),
              ],
            ),
            //
            //
            //

            //
            //
            //
            // Expanded(
            //   flex: 3,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(
            //         horizontal: getProportionateWidth(20),
            //         vertical: getProportionateHeight(20)),
            //     decoration: const BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(30),
            //           topRight: Radius.circular(30),
            //         ),
            //         color: tAccentColor),
            //     child: const Text("car properties"),

            //     // Bottom(
            //     //   carModel: !,
            //     // ),
            //   ),
            // ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              overview(widget.car.name!, Icons.speed),
              overview(
                widget.car.carDescription!,
                Icons.car_rental,
              )
            ]),
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              height: 60.0,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
              child: RawMaterialButton(
                onPressed: () {},
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                fillColor: Colors.blue.shade600,
                child: const Text(
                  "Rent now",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container overview(String text, IconData icon) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    width: SizeConfig.screenWidth! * 0.4,
    height: SizeConfig.screenHeight! * 0.08,
    decoration: BoxDecoration(
        // color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: tPrimaryColor)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: getProportionateWidth(30),
          height: getProportionateHeight(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: tAccentColor),
          child: Icon(
            icon,
            color: tOnBoardingPage3Color,
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: tOnBoardingPage2Color, fontSize: 18),
        )
      ],
    ),
  );
}
