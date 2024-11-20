import 'package:flutter/material.dart';
import 'package:renty_cars/models/Car.dart';
import 'package:renty_cars/pages/FavoriteProvider/FavoriteItem.dart';

// class Item {
//   final String name;
//   final int id;
//   Item({required this.name, required this.id});
// }

class FavoritesProvider with ChangeNotifier {
  List<Car> _favorites = [];

  List<Car> get favorites => _favorites;

  void addFavorite(Car car) {
    if (!_favorites.contains(car)) {
      _favorites.add(car);
      notifyListeners();
    }
  }

  void removeFavorite(Car car) {
    _favorites.remove(car);
    notifyListeners();
  }
}
