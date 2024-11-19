import 'package:flutter/material.dart';
import 'package:renty_cars/pages/TestCode/CarModel.dart';
import 'package:renty_cars/pages/TestCode/size_config.dart';
import 'package:renty_cars/widgets/ButtonAuth.dart';
import 'package:renty_cars/widgets/constants.dart';

class Bottom extends StatelessWidget {
  final CarModel carModel;

  const Bottom({required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'OverView',
              style: TextStyle(
                  color: tOnBoardingPage2Color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              carModel.price,
              style: const TextStyle(
                  color: tOnBoardingPage2Color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          overview(carModel.text1, Icons.speed),
          overview(
            carModel.text2,
            Icons.car_rental,
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          overview(carModel.text3, Icons.warning),
          overview(carModel.text4, Icons.chair),
        ]),
        const ButtonAuth(
          buttontext: 'Rent',
          TextColor: tOnBoardingPage2Color,
        )
      ],
    );
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
            style: TextStyle(color: tOnBoardingPage2Color, fontSize: 18),
          )
        ],
      ),
    );
  }
}
