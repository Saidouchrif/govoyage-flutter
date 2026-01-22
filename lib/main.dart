import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/screens/Categorie_screens.dart';
import 'package:travel_guide_flutter/screens/categorie_trip_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
        '/': (ctx)=> CategorieScreens(),
        CategorieTripScreens.screenRoute: (ctx)=>CategorieTripScreens(),
      },
    );
  }
}
