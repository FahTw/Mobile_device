import 'package:flutter/material.dart';
import 'package:homework/screens/music_screen.dart';

class SongItem extends StatelessWidget {
  final String title;
  final String artist;
  const SongItem({super.key, required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MusicScreen(title: title)),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  artist,
                  style: TextStyle(color: Colors.grey[500], fontSize: 13),
                ),
              ],
            ),
            Icon(Icons.more_vert, color: Colors.grey[500]),
          ],
        ),
      ),
    );
  }
}
