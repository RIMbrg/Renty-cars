import 'package:flutter/material.dart';
import 'package:renty_cars/models/car.dart';

import 'package:renty_cars/pages/CarDetailsPage.dart';
import 'package:renty_cars/widgets/CarCard.dart';

class SuggestionList extends StatefulWidget {
  SuggestionList(this.title, this.Cars, {Key? key}) : super(key: key);
  String? title;
  List<Car> Cars;

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title!,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            TextButton(onPressed: () {}, child: Text('See All'))
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        Container(
          height: 340.0,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.Cars.length,
              itemBuilder: (context, index) => CarCard(widget.Cars[index], () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CarDetailsPage(widget.Cars[index]),
                      ),
                    );
                  })),
        )
      ]),
    );
  }
}
