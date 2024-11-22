import 'package:flutter/material.dart';
import 'package:renty_cars/models/Car.dart';

// class Item {
//   final String name;
//   final int id;
//   Item({required this.name, required this.id});
// }

class ReservationsProvider with ChangeNotifier {
  List<Car> _reservations = [];

  List<Car> get reservations => _reservations;

  void addFavorite(Car car) {
    if (!_reservations.contains(car)) {
      _reservations.add(car);
      notifyListeners();
    }
  }

  void removeFavorite(Car car) {
    _reservations.remove(car);
    notifyListeners();
  }
}
