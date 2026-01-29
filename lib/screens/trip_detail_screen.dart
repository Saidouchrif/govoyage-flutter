import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';
  final Function manageFavorite;
  final Function isFavorite;
  TripDetailScreen(this.manageFavorite,this.isFavorite);
  Widget buildsectionTitle(BuildContext context ,String titleText){
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            alignment: Alignment.topLeft,
            child: Text(
              '$titleText',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
  Widget buildListView(Widget child){
    return  Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
                ),
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child:child ,
    );
  }
  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((e) => e.id == tripId);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          '${selectedTrip.title}',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedTrip.imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(
              height: 10,
            ),
            buildsectionTitle(context, 'Les activites'),
            buildListView(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildsectionTitle(context, 'Programme de jour'),
            buildListView(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx,index)=>Column(
                  children: [ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('jour ${index+1}',style: TextStyle(fontSize: 13,
                      color: Colors.white),),
                    ),
                    title: Text(selectedTrip.program[index]),
                  ),
                  Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(
          isFavorite(tripId) ? Icons.star : Icons.star_border
        ),
        onPressed: ()=>manageFavorite(tripId),
      ),
    );
  }
}
