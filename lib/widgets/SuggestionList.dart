import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renty_cars/models/Car.dart';

import 'package:renty_cars/pages/CarDetailsPage.dart';
import 'package:renty_cars/widgets/CarCard.dart';

class SuggestionList extends StatefulWidget {
  SuggestionList(this.Cars, {Key? key}) : super(key: key);
  // String? title;
  List<Car> Cars;

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       widget.title!,
        //       style:
        //           const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        //     ),
        //     TextButton(onPressed: () {}, child: Text('See All'))
        //   ],
        // ),
        const SizedBox(
          height: 12.0,
        ),
        // Expanded(child: Text('Heloo')),
        // Expanded(
        //   child:
        Container(
          // decoration: BoxDecoration(color: Colors.blueGrey),
          height: 540.0,
          width: double.infinity,

          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            scrollDirection: Axis.vertical,
            itemCount: widget.Cars.length,
            itemBuilder: (context, index) => CarCard(widget.Cars[index], () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailsPage(widget.Cars[index]),
                ),
              );
            }),
          ),
        ),

        // )
      ]),
    );
  }
}
