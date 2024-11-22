import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renty_cars/models/Car.dart';
import 'package:renty_cars/pages/Favorite/FavoriteProvider.dart';
import 'package:renty_cars/pages/Reservations/ReservationsProvider.dart';

class FavoriteButton extends StatelessWidget {
  final Car car; // The car to be added/removed from favorites

  FavoriteButton({required this.car});

  @override
  Widget build(BuildContext context) {
    final reservationsProvider =
        context.watch<ReservationsProvider>(); // Watch the reservations list

    // Determine if the car is already in the reservations list
    bool isFavorite = reservationsProvider.reservations.contains(car);

    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null, // Red color if it's a favorite
      ),
      onPressed: () {
        // Toggle favorite status (add or remove car)
        if (isFavorite) {
          reservationsProvider.removeFavorite(car);
        } else {
          reservationsProvider.addFavorite(car);
        }
      },
    );
  }
}
