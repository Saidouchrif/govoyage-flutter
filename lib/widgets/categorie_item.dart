import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_guide_flutter/screens/categorie_trip_screens.dart';

class CategorieItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  CategorieItem(this.imageUrl, this.title,this.id);

void selectCategorie(BuildContext ctx){
  Navigator.of(ctx).push(MaterialPageRoute(builder: (c)=>CategorieTripScreens(id,title),
  ),
  );
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>selectCategorie(context) ,
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ],
      ),
    );
  }
}
