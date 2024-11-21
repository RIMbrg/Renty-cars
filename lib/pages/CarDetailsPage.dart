// ignore: file_names
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import 'package:renty_cars/models/Car.dart';

import 'package:renty_cars/pages/TestCode/size_config.dart';
import 'package:renty_cars/widgets/CarCard.dart';

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
        leading: BackButton(color: tAccentColor),
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        title: Text(
          widget.car.name!,
          style: const TextStyle(color: tPrimaryColor),
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
            // Car image
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

            // Text(
            //   widget.car.carDescription!,
            //   style: TextStyle(
            //     color: Colors.blue.shade600,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 18.0,
            //   ),
            // ),
            // const SizedBox(height: 8.0),

            CarPreDetails(widget.car),
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

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Properties',
                      style: TextStyle(
                        color: tSecondaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    //                 Car(
                    //   this.name,
                    //   this.carModel,
                    //   this.year,
                    //   this.rentalPrice,
                    //   this.transmission,
                    //   this.fuelType,
                    //   this.maxSpeed,
                    //   this.capacity,
                    //   this.carImageUrl,
                    //   this.carLocation,
                    // );
                    overview(
                      widget.car.transmission!,
                      Icons.car_repair,
                    ),
                    overview(widget.car.fuelType!, Icons.warning),

                    overview(widget.car.maxSpeed!, Icons.speed),
                    overview(widget.car.capacity!, Icons.chair),
                  ]),
            ),
            //Button rent now
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
                fillColor: tAccentColor,
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
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    // width: SizeConfig.screenWidth! * 0.4,
    // height: SizeConfig.screenHeight! * 0.08,
    // decoration: BoxDecoration(
    //     // color: kPrimaryColor,
    //     borderRadius: BorderRadius.circular(20),
    //     border: Border.all(color: tAccentColor)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: getProportionateWidth(30),
          height: getProportionateHeight(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: tPrimaryColor),
          child: Icon(
            icon,
            color: tWhiteColor,
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(
              color: tPrimaryColor, fontSize: 18, fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}
