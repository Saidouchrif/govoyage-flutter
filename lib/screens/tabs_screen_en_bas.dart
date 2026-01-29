import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_guide_flutter/models/trip.dart';
import 'package:travel_guide_flutter/screens/Categorie_screens.dart';
import 'package:travel_guide_flutter/screens/Favorite_Screen.dart';
import 'package:travel_guide_flutter/widgets/app_drawer.dart';

class TabsScreenEnBas extends StatefulWidget {
  final List<Trip> favoriteTripe;

  TabsScreenEnBas(this.favoriteTripe);

  @override
  State<TabsScreenEnBas> createState() => _TabsScreenEnBasState();
}

class _TabsScreenEnBasState extends State<TabsScreenEnBas> {
  void _selectScrenn(int index) {
    setState(() {
      _selectedScreensIndex = index;
    });
  }

  int _selectedScreensIndex = 0;
  late List<Map<String, Object>> _screens;
  @override
  void initState() {
    _screens = [
      {
        "Screen": CategorieScreens(),
        'Title': 'Catégories des voyages',
      },
      {
        'Screen': FavoriteScreen(widget.favoriteTripe),
        'Title': 'Voyages favoris',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          _screens[_selectedScreensIndex]['Title'] as String,
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreensIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreensIndex,
        onTap: _selectScrenn,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Catégories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoris',
          ),
        ],
      ),
    );
  }
}
