import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renty_cars/pages/FavoriteProvider/FavoriteProvider.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;

    return Scaffold(
      appBar:
          // MyAppBar(pageTitle: 'Favorites'),

          AppBar(
        title: Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? Center(child: Text('No favorites yet!'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final car = favorites[index];
                return ListTile(
                  title: Text(car.name!),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<FavoritesProvider>().removeFavorite(car);
                    },
                  ),
                );
              },
            ),
    );
  }
}
