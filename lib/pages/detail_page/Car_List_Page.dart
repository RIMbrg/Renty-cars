import 'package:flutter/material.dart';
import 'package:renty_cars/pages/detail_page/car_details_page.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';

class CarListPage extends StatelessWidget {
  final List<Map<String, dynamic>> cars = [
    {
      'name': 'Tesla Model S',
      'model': '2023',
      'image': 'lib/images/Car1.jpg',
      'description':
          'A sleek electric sedan with impressive range and acceleration.',
      'rentalPrice': 100.00,
    },
    {
      'name': 'BMW X5',
      'model': '2022',
      'image': 'https://link-to-image.com/bmw_x5.jpg',
      'description': 'Luxury SUV with a comfortable ride and modern features.',
      'rentalPrice': 150.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        pageTitle: 'Offers',
      ),
      // AppBar(
      //   title: Text('Car Rentals'),
      // ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return Card(
            margin: EdgeInsets.all(16),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(car['name']),
              subtitle: Text('${car['model']} - \$${car['rentalPrice']} / day'),
              leading: Image.network(car['image'],
                  width: 60, height: 60, fit: BoxFit.cover),
              onTap: () {
                // Navigate to the car details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailsPage(
                      carName: car['name'],
                      carModel: car['model'],
                      carImageUrl: car['image'],
                      carDescription: car['description'],
                      rentalPrice: car['rentalPrice'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
