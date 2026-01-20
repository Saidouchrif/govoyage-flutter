import 'package:flutter/material.dart';

class CategorieTripScreens extends StatelessWidget {
  final String categorieId;
  final String categorieTitle;

  CategorieTripScreens(this.categorieId,this.categorieTitle);
  @override
  Widget build(BuildContext context) {
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