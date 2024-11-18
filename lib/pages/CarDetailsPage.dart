import 'package:flutter/material.dart';

import 'package:renty_cars/models/car.dart';
import 'package:renty_cars/widgets/ButtonFavorite.dart';

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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blueAccent),
        title: Text(
          widget.car.carModel!,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: 10.0),
            Text(
              widget.car.carDescription!,
              style: TextStyle(
                color: Colors.blue.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.car.carName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                Text(
                  widget.car.carLocation!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.car.rentalPrice}\$/Month",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  overflow: TextOverflow.ellipsis,
                ),
                ButtonFavorite(),
              ],
            ),
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
                child: Text(
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
