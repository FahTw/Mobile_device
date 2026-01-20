import 'package:flutter/material.dart';
import 'package:homework/screens/playlist_screen.dart';

class AlbumCard extends StatelessWidget {
  final String title;
  final String coverUrl;

  const AlbumCard({super.key, required this.title, required this.coverUrl});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF282828),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlaylistScreen()),
          );
        },
        splashColor: Colors.white10,
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  coverUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ) ??
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.play_circle_fill, color: Colors.white, size: 28),
            ],
          ),
        ),
      ),
    );
  }
}
