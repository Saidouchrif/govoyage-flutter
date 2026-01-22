import 'package:flutter/material.dart';

class CategorieTripScreens extends StatelessWidget {
  static const screenRoute ='/categoriesTrips';
  const CategorieTripScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final routeArgument=ModalRoute.of(context)!.settings.arguments as Map <String , String>;
    final categorieId= routeArgument['id']!;
    final categorieTitle=routeArgument['title']!;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(categorieTitle,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(' la list des voyages de cette categorie')
        ),
    );
  }
}