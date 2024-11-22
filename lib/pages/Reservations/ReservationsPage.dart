import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renty_cars/pages/CarDetailsPage.dart';
import 'package:renty_cars/pages/Favorite/FavoriteProvider.dart';
import 'package:renty_cars/pages/Reservations/ReservationsProvider.dart';
import 'package:renty_cars/widgets/CarCard.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';
import 'package:renty_cars/widgets/MyAppBarHome.dart';
import 'package:renty_cars/widgets/constants.dart';

class ReservationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reservations = context.watch<ReservationsProvider>().reservations;

    return Scaffold(
      backgroundColor: tWhiteColor,
      appBar: MyAppBar(pageTitle: 'Reservations'),

      // AppBar(title: const Text('Reservations')),
      body: reservations.isEmpty
          ? Center(child: Text('No reservations yet!'))
          : ListView.builder(
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                final car = reservations[index];
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
