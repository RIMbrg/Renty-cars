import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renty_cars/pages/CarDetailsPage.dart';
import 'package:renty_cars/pages/FavoriteProvider/FavoriteProvider.dart';
import 'package:renty_cars/widgets/CarCard.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';
import 'package:renty_cars/widgets/MyAppBarHome.dart';
import 'package:renty_cars/widgets/constants.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;

    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: MyAppBar(pageTitle: 'Favorites'),

      // AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
          ? Center(child: Text('No favorites yet!'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final car = favorites[index];
                return CarCard(car, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarDetailsPage(car),
                    ),
                  );
                });

                // return Row(
                //   children: [
                //     CarCard(car, () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => CarDetailsPage(car),
                //         ),
                //       );
                //     }),
                //     IconButton(
                //       icon: const Icon(Icons.delete),
                //       onPressed: () {
                //         context.read<FavoritesProvider>().removeFavorite(car);
                //       },
                //     ),
                //   ],
                // );
              },
            ),
    );
  }
}
