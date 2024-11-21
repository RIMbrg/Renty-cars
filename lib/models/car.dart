// class Car {
//   final String? name;
//   final String? carModel;
//   final String? carImageUrl;
//   final String? carDescription;
//   final String? carLocation;
//   final double? rentalPrice;

//   Car(
//     this.name,
//     this.carModel,
//     this.carImageUrl,
//     this.carDescription,
//     this.carLocation,
//     this.rentalPrice,
//   );

//   static List<Car> recommandation = [
//     Car(
//       'Tesla Model S',
//       '2023',
//       'lib/images/car1.jpg',
//       'A sleek electric sedan with impressive range and acceleration.',
//       'Tunis',
//       100.00,
//     ),
//     Car(
//       'BMW X5',
//       '2022',
//       'lib/images/car2.jpg',
//       'Luxury SUV with a comfortable ride and modern features.',
//       'Sfax',
//       150.00,
//     ),
//     Car(
//       'Mercedes Model S',
//       '2023',
//       'lib/images/car3.jpg',
//       'A sleek electric sedan with impressive range and acceleration.',
//       'Gabes',
//       100.00,
//     ),
//   ];

//   static List<Car> nearby = [
//     Car(
//       'Mercedes Model S',
//       '2023',
//       'lib/images/Car1.jpg',
//       'A sleek electric sedan with impressive range and acceleration.',
//       'Gabes',
//       100.00,
//     ),
//     Car(
//       'Kia X5',
//       '2022',
//       'https://link-to-image.com/bmw_x5.jpg',
//       'Luxury SUV with a comfortable ride and modern features.',
//       'Sousse',
//       150.00,
//     ),
//   ];
// }

// //
// //
// //
// // The New car model
// //
// //
// //

class Car {
  final String? name;
  final String? carModel;
  final String? year;
  final double? rentalPrice;
  final String? transmission;
  final String? fuelType;
  final String? maxSpeed;
  final String? capacity;
  final String? carImageUrl;
  final String? carLocation;

  Car(
    this.name,
    this.carModel,
    this.year,
    this.rentalPrice,
    this.transmission,
    this.fuelType,
    this.maxSpeed,
    this.capacity,
    this.carImageUrl,
    this.carLocation,
  );

  static List<Car> recommandation = [
    Car(
      'Tesla',
      ' Model S',
      '2023',
      100.00,
      'Automatic',
      'Electric',
      '400 Km/hr',
      '4 Seats',
      'lib/images/car1.jpg',
      'Tunis',
    ),
    Car(
      'BMW',
      'X5',
      '2022',
      100.00,
      'Manual',
      'Diesel',
      '300 Km/hr',
      '7 Seats',
      'lib/images/car2.jpg',
      'Gabes',
    ),
    Car(
      'Mercedes',
      'Model S',
      '2023',
      100.00,
      'Manual',
      'Petrol',
      '220 Km/hr',
      '5 Seats',
      'lib/images/car3.jpg',
      'Sfax',
    ),
  ];

  static List<Car> nearby = [
    Car(
      'Mercedes',
      ' Model S',
      '2023',
      100.00,
      'Automatic',
      'Hybrid',
      '350 Km/hr',
      '4 Seats',
      'lib/images/car1.jpg',
      'Tunis',
    ),
    Car(
      'Kia',
      ' X5',
      '2022',
      100.00,
      'Automatic',
      'Electric',
      '200 Km/hr',
      '4 Seats',
      'lib/images/car1.jpg',
      'Tunis',
    ),
  ];
}
