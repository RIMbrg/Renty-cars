// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:renty_cars/utilities/car.dart';
import 'package:renty_cars/utilities/constants.dart';
import 'package:renty_cars/widgets/carblock.dart';
import 'package:renty_cars/widgets/pick-up.dart';


class CarDetailsScreen extends StatefulWidget {
  CarDetailsScreen({required this.car});
  final Car car;

  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details'),
      ),
      body: SafeArea(
        child: ListView(
          padding: new EdgeInsets.all(8.0),
          children: [
            CarBlock(widget.car),
            // OffersWidget(widget.car.offers),
            PickupInfoWidget(widget.car),
            // MapWidget(widget.car),
            Divider(),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return TermsScreen(car: widget.car);
                // }));
              },
              child: ListTile(
                title: Text("Rental terms"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Divider(),
            SizedBox(
              height: kInputSpacing,
            ),
            Padding(
              padding: kFixedButtonPadding,
              child: ElevatedButton(
            
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return DriverDetailsScreen(car: widget.car);
                  // }));
                },
                child: Text(
                  'Book now, pay later!',
                  style: kButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}