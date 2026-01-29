import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/app_data.dart';
import 'package:travel_guide_flutter/widgets/Trip_item.dart';

class CategorieTripScreens extends StatelessWidget {
  static const screenRoute = '/categoriesTrips';
  const CategorieTripScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categorieId = routeArgument['id']!;
    final categorieTitle = routeArgument['title']!;
    final filteredTrips = Trips_data.where((trip) {
      return trip.categories.contains(categorieId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          categorieTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
              id: filteredTrips[index].id,
              duration: filteredTrips[index].duration,
              imageUrl: filteredTrips[index].imageUrl,
              season: filteredTrips[index].season,
              title: filteredTrips[index].title,
              tripType: filteredTrips[index].tripType);
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}
