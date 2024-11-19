import 'package:flutter/material.dart';
import 'package:renty_cars/pages/TestCode/Bottom.dart';
import 'package:renty_cars/pages/TestCode/CarModel.dart';
import 'package:renty_cars/pages/TestCode/size_config.dart';
import 'package:renty_cars/widgets/constants.dart';

class DetailsScreen extends StatelessWidget {
  final CarModel carModel;

  const DetailsScreen({required this.carModel});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: tAccentColor),
        backgroundColor: tOnBoardingPage2Color,
        elevation: 0,
        title: Text(carModel.title),
      ),
      backgroundColor: tWhiteColor,
      body: SafeArea(
        bottom: false,
        child: DetailsBody(
          carModel: carModel,
        ),
      ),
    );
  }
}

class DetailsBody extends StatelessWidget {
  final CarModel carModel;

  const DetailsBody({required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
//
//Child1
//
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateWidth(20),
                vertical: getProportionateHeight(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carModel.title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '2017',
                  style: TextStyle(fontSize: 20, height: 1.5),
                )
              ],
            ),
          ),
        ),
//
//Child2
//
        Expanded(
          flex: 2,
          child: Center(
            child: Image.asset(
              carModel.image,
              width: getProportionateWidth(350),
            ),
          ),
        ),
//
//Child3
//
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateWidth(20),
                vertical: getProportionateHeight(20)),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: tAccentColor),
            child: Bottom(
              carModel: carModel,
            ),
          ),
        )
      ],
    );
  }
}
