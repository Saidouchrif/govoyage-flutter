import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/app_data.dart';
import 'package:travel_guide_flutter/models/trip.dart';
import 'package:travel_guide_flutter/widgets/Trip_item.dart';

class CategorieTripScreens extends StatefulWidget {
  static const screenRoute = '/categoriesTrips';
  final List<Trip> availableTrips;
  CategorieTripScreens(this.availableTrips);


  @override
  State<CategorieTripScreens> createState() => _CategorieTripScreensState();
}

class _CategorieTripScreensState extends State<CategorieTripScreens> {
  late String categorieTitle;
  late List<Trip> displayTrip;
  bool _loadedInitData = false;

  @override
  void initState() {
    ///
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgument =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      final categorieId = routeArgument['id']!;
      categorieTitle = routeArgument['title']!;

      displayTrip = widget.availableTrips.where((trip) {
        return trip.categories.contains(categorieId);
      }).toList();

      _loadedInitData = true; 
    }
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrip.removeWhere((e) => e.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            id: displayTrip[index].id,
            duration: displayTrip[index].duration,
            imageUrl: displayTrip[index].imageUrl,
            season: displayTrip[index].season,
            title: displayTrip[index].title,
            tripType: displayTrip[index].tripType,
            //removeItem: _removeTrip,
          );
        },
        itemCount: displayTrip.length,
      ),
    );
  }
}
