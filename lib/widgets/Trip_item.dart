import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/models/trip.dart';

class TripItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  const TripItem(
      {required this.duration,
      required this.imageUrl,
      required this.season,
      required this.title,
      required this.tripType});

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'Hiver';
      case Season.Autumn:
        return 'Automne';
      case Season.Summer:
        return 'Été';
      case Season.Spring:
        return 'Printemps';
      default:
        return 'Inconnu';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'Exploration';
      case TripType.Activities:
        return 'Activités';
      case TripType.Recovery:
        return 'Détente';
      case TripType.Therapy:
        return 'Thérapie';
      default:
        return 'Inconnu';
    }
  }

  void selectTrip() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectTrip,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: [0.6, 1],
                  )),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(
                      Icons.today,
                      color: Color.fromARGB(255, 243, 219, 4),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '$duration Jours',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  Row(children: [
                    Icon(
                      Icons.wb_sunny,
                      color: Color.fromARGB(255, 243, 219, 4),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      seasonText,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  Row(children: [
                    Icon(
                      Icons.family_restroom,
                      color: Color.fromARGB(255, 243, 219, 4),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      tripTypeText,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
