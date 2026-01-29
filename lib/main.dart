import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/app_data.dart';
import 'package:travel_guide_flutter/models/trip.dart';
import 'package:travel_guide_flutter/screens/categorie_trip_screens.dart';
import 'package:travel_guide_flutter/screens/filter_screen.dart';
import 'package:travel_guide_flutter/screens/tabs_screen_en_bas.dart';
import 'package:travel_guide_flutter/screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters={
    'summer':false,
    'winter':false,
    'family':false,
  };

  List<Trip> _availableTrips= Trips_data;

  List<Trip> _favoriteTrips=[];

  void _changeFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;
      _availableTrips=Trips_data.where((e){
        if(_filters['summer']==true && e.isInSummer!=true){
          return false;
        }
        if(_filters['winter']==true && e.isInWinter!=true){
          return false;
        }        
        if(_filters['summer']==true && e.isForFamilies!=true){
          return false;
        }
        return true;
      }).toList();
    });
  }
  void _manageFavorite(String tripId){
    final exsisteIndex = _favoriteTrips.indexWhere((e)=>e.id==tripId);
    if(exsisteIndex>=0){
      setState(() {
        _favoriteTrips.removeAt(exsisteIndex);
      });
    }else{
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((e)=>e.id==tripId));
      });
    }
  }
  bool _isFavorite(String id){
    return _favoriteTrips.any((e)=>e.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            secondary: Colors.amber,
          ),
          fontFamily: 'Montserrat',
          textTheme: ThemeData.light().textTheme.copyWith()),
        initialRoute: '/',
      routes: {
        '/': (ctx)=> TabsScreenEnBas(_favoriteTrips),
        CategorieTripScreens.screenRoute: (ctx)=>CategorieTripScreens(_availableTrips),
        TripDetailScreen.screenRoute:(ctx)=>TripDetailScreen(_manageFavorite,_isFavorite),
        FilterScreen.screenRoute:(ctx)=>FilterScreen(_changeFilters,_filters),
      },
    );
  }
}
