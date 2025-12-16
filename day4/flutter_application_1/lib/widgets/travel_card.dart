import 'package:flutter/material.dart';
import '../models/travel_spot.dart';

class TravelCard extends StatelessWidget {
  final TravelSpot spot;
  const TravelCard({super.key, required this.spot});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              spot.imageUrl,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(
              spot.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(spot.location),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
