/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/screens/Categorie_screens.dart';
import 'package:travel_guide_flutter/screens/Favorite_Screen.dart';

class TabsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('Guide touristique',style: TextStyle(color: Colors.white),),
          bottom: TabBar(
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.yellowAccent,
            indicatorColor: Colors.yellow,
            tabs: [
              Tab(
                
                icon: Icon(Icons.dashboard,color: Colors.white,),
                text: 'Catégories',
              ),
              Tab(
                icon: Icon(Icons.star,color: Colors.white,),
                text: 'Favoris',
              )
            ],
          ),
        ), 
        body: TabBarView(
          children: [
            CategorieScreens(),
            FavoriteScreen(),
          ],
        ),      
      ),
    );
  }
}
*/