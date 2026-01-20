import 'package:flutter/material.dart';
import 'package:homework/models/playlist.dart';
import 'package:homework/widgets/album_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Playlist> playlists = [
      Playlist(
        title: 'วัชราวลี',
        artist: 'Artist Name',
        album: 'Best Hits',
        cover:
            'https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=640&auto=format&fit=crop&q=60',
      ),
      Playlist(
        title: 'คล้ายสวรรค์',
        artist: 'Various Artists',
        album: 'Chill Mix',
        cover:
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=640&auto=format&fit=crop&q=60',
      ),
      Playlist(
        title: 'รวมเพลงฟังสบายสไตล์ ร้านกาแฟ',
        artist: 'โน วัน เอลส์',
        album: 'Chill Mix',
        cover:
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=640&auto=format&fit=crop&q=60',
      ),
      Playlist(
        title: 'ปีนี้ไม่ต้องเหงาคนเดียวแล้วโว้ย',
        artist: 'Various Artists',
        album: 'Chill Mix',
        cover:
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=640&auto=format&fit=crop&q=60',
      ),
      Playlist(
        title: 'fellow fellow',
        artist: 'เฟลโล่ เฟลโล่',
        album: 'Chill Mix',
        cover:
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=640&auto=format&fit=crop&q=60',
      ),
      Playlist(
        title: 'รองเท้าเก่า',
        artist: 'แทททูคัลเลอร์',
        album: 'รองเท้าเก่า',
        cover:
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=640&auto=format&fit=crop&q=60',
      ),
      Playlist(
        title: 'Avenue',
        artist: 'วัชราวลี',
        album: 'Avenue',
        cover:
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=640&auto=format&fit=crop&q=60',
      ),
      Playlist(
        title: 'ทราย',
        artist: 'วัชราวลี',
        album: 'ทราย',
        cover:
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=640&auto=format&fit=crop&q=60',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'สวัสดี คุณ fah',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 250,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 96, 96, 96),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.history, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3.6,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final playList = playlists[index];
                  return AlbumCard(
                    title: playList.title,
                    coverUrl: playList.cover,
                  );
                }, childCount: playlists.length),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://cdn-images.dzcdn.net/images/cover/a7869f82f4817625bc183a6c2882127d/500x500-000000-80-0-0.jpg',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'เป็นที่นิยมในหมู่ผู้ฟังของ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'คล้ายสวรรค์',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'แสดงทั้งหมด',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
