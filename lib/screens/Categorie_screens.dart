import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/app_data.dart';
import 'package:travel_guide_flutter/widgets/categorie_item.dart';

class CategorieScreens extends StatelessWidget {
  const CategorieScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Guide touristique',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        children:Categories_data.map((c)=>CategorieItem(c.imageUrl, c.title,c.id)).toList(),
      ),
    );
  }
}