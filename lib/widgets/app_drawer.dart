import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {

  ListTile buildListTile(String title, IconData icon, VoidCallback  onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              'Guide touristique',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Les voyages', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
    
          buildListTile('Filter', Icons.filter_list, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.screenRoute);
          }),
        ],
      ),
    );
  }
}
