import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renty_cars/models/Car.dart';
import 'package:renty_cars/pages/FavoriteProvider/FavoriteProvider.dart';

class FavoriteButton extends StatelessWidget {
  final Car car; // The car to be added/removed from favorites

  FavoriteButton({required this.car});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider =
        context.watch<FavoritesProvider>(); // Watch the favorites list

    // Determine if the car is already in the favorites list
    bool isFavorite = favoritesProvider.favorites.contains(car);

    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null, // Red color if it's a favorite
      ),
      onPressed: () {
        // Toggle favorite status (add or remove car)
        if (isFavorite) {
          favoritesProvider.removeFavorite(car);
        } else {
          favoritesProvider.addFavorite(car);
        }
      },
    );
  }
}
