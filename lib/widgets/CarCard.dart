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
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          color: const Color(0x00fcf9f8),
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
              const SizedBox(height: 8.0),
              Text(
                widget.car.carName!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
                overflow: TextOverflow.ellipsis,
              ),
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
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.car.rentalPrice}\$/Month",
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
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
