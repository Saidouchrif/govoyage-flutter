import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/screens/Categorie_screens.dart';
import 'package:travel_guide_flutter/screens/Favorite_Screen.dart';

class TabsScreenEnBas extends StatefulWidget {
  const TabsScreenEnBas({super.key});

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
  final List<Map<String,Object>> _screens = [
    {
      "Screen":CategorieScreens(),
      'Title':'Catégories des voyages',
    },{
      'Screen':FavoriteScreen(),
      'Title':'Voyages favoris',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          _screens[_selectedScreensIndex]['Title'] as String,
          style: TextStyle(color: Colors.white),
        ),
      ),
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
