// ignore_for_file: unused_local_variable, prefer_const_constructors, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:renty_cars/utilities/car.dart';
import 'package:renty_cars/utilities/constants.dart';
import 'package:renty_cars/utilities/driver.dart';
import 'package:renty_cars/utilities/global_data.dart';
import 'package:renty_cars/widgets/carblock.dart';
import 'package:renty_cars/widgets/custumer.dart';

import '../services/ota.dart';

class DriverDetailsScreen extends StatefulWidget {
  late final Car car;

  @override
  _DriverDetailsScreenState createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  //Form controllers
  final _formKey = GlobalKey<FormState>();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  var _scaffoldKey;
  var pr = null;

  @override
  Widget build(BuildContext context) {
    final _detailsFormKey = GlobalKey<FormState>();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Driver Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: CustomInputWidget(
                            "First Name",
                            fnameController,
                            TextInputType.text,
                            true,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Flexible(
                          child: CustomInputWidget(
                            "Last Name",
                            lnameController,
                            TextInputType.text,
                            true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kInputSpacing,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: CustomInputWidget(
                            "Email Address",
                            emailController,
                            TextInputType.emailAddress,
                            false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kInputSpacing,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: CustomInputWidget(
                            "Phone Number",
                            phoneController,
                            TextInputType.phone,
                            false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kInputSpacing,
                    ),
                    SizedBox(
                      width: double.infinity,
                   child: ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, // Couleur de fond
    foregroundColor: Colors.white, // Couleur du texte
    padding: EdgeInsets.symmetric(vertical: 16.0), // Espacement en haut et en bas
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      ),
  ),
  onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            //Create a driver object to use with vehicle reservation
                            var driver = Driver(
                              fName: fnameController.text,
                              lName: lnameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              residency: 'US',
                              age: 30,
                            );
                            // makeReservation(driver);
                          } //end if
                        },
                        child: Text(
                          'Book now!',
                          style: kButtonTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kInputSpacing,
                    ),
                    // CarBlock(widget.car as Car),
                  ]))
        ],
      ),
    );
  }
}