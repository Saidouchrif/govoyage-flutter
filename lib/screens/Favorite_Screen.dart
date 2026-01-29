import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/models/trip.dart';
import 'package:travel_guide_flutter/widgets/Trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;

  const FavoriteScreen(this.favoriteTrips, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return const Center(
        child: Text(
          'Vous n’avez aucun voyage dans vos favoris',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteTrips.length,
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            duration: favoriteTrips[index].duration,
            imageUrl: favoriteTrips[index].imageUrl,
            season: favoriteTrips[index].season,
            title: favoriteTrips[index].title,
            tripType: favoriteTrips[index].tripType,
          );
        },
      );
    }
  }
}
