import 'package:flutter/material.dart';

import 'package:renty_cars/models/car.dart';
import 'package:renty_cars/widgets/ButtonFavorite.dart';

class CarCard extends StatefulWidget {
  CarCard(this.car, this.onTap, {Key? key}) : super(key: key);
  Car car;
  Function()? onTap;

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          color: Color(0xfcf9f8),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade200)),
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade200,
                  image: DecorationImage(
                    image: AssetImage(widget.car.carImageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                widget.car.carName!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.car.rentalPrice}\$/Month",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  ButtonFavorite(),
                ],
              )
            ]),
      ),
    );
  }
}
