import 'package:flutter/material.dart';
import '../models/travel_spot.dart';
import '../widgets/travel_card.dart';

class HomeScreen extends StatelessWidget {

  final List<TravelSpot> spots = [
    TravelSpot(
      name: 'Eiffel Tower',
      location: 'Paris, France',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVQlZHONM4AatbQJH7RGjWWmGHpwysj4Fp1Q&s',
    ),
    TravelSpot(
      name: 'Great Wall',
      location: 'China',
      imageUrl: 'https://cdn.britannica.com/89/179589-138-3EE27C94/Overview-Great-Wall-of-China.jpg?w=800&h=450&c=crop',
    ),
    TravelSpot(
      name: 'Grand Canyon',
      location: 'Arizona, USA',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/aa/Dawn_on_the_S_rim_of_the_Grand_Canyon_%288645178272%29.jpg',
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thailand Travel"),
      ),
      body: ListView.builder(
        itemCount: spots.length,
        itemBuilder:(context, index) {
          return TravelCard(spot: spots[index]);
        },
      ),
    );
  }
}