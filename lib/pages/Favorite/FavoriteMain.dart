import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renty_cars/pages/Favorite/FavoriteButton.dart';
import 'package:renty_cars/pages/Favorite/FavoritePage.dart';
import 'package:renty_cars/pages/Favorite/FavoriteProvider.dart';

import 'package:renty_cars/models/Car.dart';
// Import the FavoriteButton widget

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

// class Item {
//   final String name;
//   final int id;
//   Item({required this.name, required this.id});
// }

class MainPage extends StatelessWidget {
  // final List<Car> cars = [
  //   Car(id: 1, name: 'Car 1'),
  //   Car(id: 2, name: 'Car 2'),
  //   Car(id: 3, name: 'Car 3'),
  // ];

  final List<Car> recommandation = [
    //   Car(
    //     'Tesla Model S',
    //     '2023',
    //     'lib/images/car1.jpg',
    //     'A sleek electric sedan with impressive range and acceleration.',
    //     'Tunis',
    //     100.00,
    //   ),
    //   Car(
    //     'BMW X5',
    //     '2022',
    //     'lib/images/car2.jpg',
    //     'Luxury SUV with a comfortable ride and modern features.',
    //     'Sfax',
    //     150.00,
    //   ),
    //   Car(
    //     'Mercedes Model S',
    //     '2023',
    //     'lib/images/car3.jpg',
    //     'A sleek electric sedan with impressive range and acceleration.',
    //     'Gabes',
    //     100.00,
    //   ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        actions: [
          // Navigate to the Favorites Page
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recommandation.length,
        itemBuilder: (context, index) {
          final car = recommandation[index];
          return ListTile(
            title: Text(car.name!),

            //****************************************** */
            trailing: FavoriteButton(car: car), // Use the FavoriteButton widget
          );
        },
      ),
    );
  }
}
