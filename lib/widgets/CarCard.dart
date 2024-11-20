import 'package:flutter/material.dart';

import 'package:renty_cars/models/Car.dart';
import 'package:renty_cars/pages/FavoriteProvider/FavoriteButton.dart';
import 'package:renty_cars/widgets/ButtonFavorite.dart';
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
              const SizedBox(height: 8.0),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child:

              // ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//**************name of the car
                    Text(
                      widget.car.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: tPrimaryColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),

                    //**************** Location of the car

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
                    const SizedBox(height: 8.0),
//**************  Price of the car
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.car.rentalPrice}DT per day ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: tAccentColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                        FavoriteButton(car: widget.car),
                        // ButtonFavorite(),
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
