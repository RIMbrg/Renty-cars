import 'package:flutter/material.dart';
import 'package:renty_cars/pages/TestCode/CarModel.dart';
import 'package:renty_cars/pages/TestCode/CarModelCard.dart';
import 'package:renty_cars/widgets/constants.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          SearchBar(),
          // BuildCircle(),
          Container(
            margin: EdgeInsets.only(
                right: (15), left: (15), top: (10), bottom: (0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Cars',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: (40),
                  height: (40),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 5,
                          color: tOnBoardingPage3Color.withOpacity(0.5))
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: tOnBoardingPage3Color.withOpacity(0.8),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: Icon(
                    Icons.filter_alt,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Column(
            children: List.generate(
              carmodel.length,
              (index) => CarModelCard(
                carModel: carmodel[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
