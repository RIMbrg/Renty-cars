import 'package:flutter/material.dart';

import 'package:renty_cars/models/Car.dart';
import 'package:renty_cars/widgets/FavoriteButton.dart';
import 'package:renty_cars/widgets/OldWidgets/ButtonFavorite.dart';
import 'package:renty_cars/widgets/constants.dart';

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
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          color: const Color(0xfcf9f8),
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
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade200,
                  image: DecorationImage(
                    image: AssetImage(widget.car.carImageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              CarPreDetails(widget.car),
            ]),
      ),
    );
  }
}

//
//
//
//
//

class CarPreDetails extends StatelessWidget {
  const CarPreDetails(this.car, {super.key});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //**************name of the car
              Text(
                car.name!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: tPrimaryColor),
                overflow: TextOverflow.ellipsis,
              ),
              //**************** Location of the car
              Row(
                children: [
                  Text(
                    car.carLocation!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: tSecondaryColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Icon(
                    Icons.location_on,
                    color: tSecondaryColor,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 5.0),
//**************  Price of the car
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${car.rentalPrice}DT per day ",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: tAccentColor),
                overflow: TextOverflow.ellipsis,
              ),
              FavoriteButton(car: car),
              // ButtonFavorite(),
            ],
          )
        ],
      ),
    );
  }
}
