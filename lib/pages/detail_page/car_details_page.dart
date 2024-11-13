import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  final String carName;
  final String carModel;
  final String carImageUrl;
  final String carDescription;
  final double rentalPrice;

  // Constructor to receive car details
  CarDetailsPage({
    required this.carName,
    required this.carModel,
    required this.carImageUrl,
    required this.carDescription,
    required this.rentalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carName),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Car Image
              Center(
                child: Image.asset(
                  carImageUrl,
                  height: 250,
                  width: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Car Name and Model
              Text(
                '$carName - $carModel',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              // Car Description
              Text(
                carDescription,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 16),
              // Rental Price
              Text(
                '\$${rentalPrice.toStringAsFixed(2)} / day',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 24),
              // Book Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to booking page or handle booking
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Booking ${carName}'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
