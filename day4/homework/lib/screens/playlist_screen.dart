import 'package:flutter/material.dart';
import 'music_screen.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});
  final String title = "วัชราวลี";
  final String artist = "วัชราวลี";
  final String coverUrl =
      "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=640&auto=format&fit=crop&q=60";

  @override
  Widget build(BuildContext context) {
    // ใช้ Scaffold สีดำเป็นฐาน
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        title: Text(
          '', // ปกติหน้า Album ของ Spotify จะไม่โชว์ Title ตรง AppBar ตอนแรก
          style: TextStyle(color: Colors.white),
        ),
      ),

      // ใช้ Stack หรือ Container ที่มี Gradient เพื่อทำพื้นหลังสีฟุ้งๆ ด้านบน
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors
                  .brown
                  .shade900, // สีที่ดึงมาจากปก (สมมติว่าเป็นสีน้ำตาลเข้ม)
              Colors.black,
            ],
            stops: [0.0, 0.6], // ไล่สีถึงแค่ 60% ของหน้าจอ
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(coverUrl, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(coverUrl),
                      ),
                      SizedBox(width: 8),
                      Text(
                        artist,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Album • 2024",
                    style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.grey[400],
                        size: 28,
                      ),
                      SizedBox(width: 24),
                      Icon(
                        Icons.arrow_circle_down,
                        color: Colors.grey[400],
                        size: 28,
                      ),
                      SizedBox(width: 24),
                      Icon(Icons.more_horiz, color: Colors.grey[400], size: 28),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF1DB954),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.play_arrow),
                          color: Colors.black,
                          iconSize: 32,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MusicScreen(title: title),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  _buildSongItem(context, 1, "เธอยูนีค", artist),
                  _buildSongItem(context, 2, "ร่มสีเทา", artist),
                  _buildSongItem(context, 3, "ทราย", artist),
                  _buildSongItem(context, 4, "Jeep", artist),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget สำหรับสร้างแถวเพลง
  Widget _buildSongItem(
    BuildContext context,
    int index,
    String title,
    String artist,
  ) {
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
                    color: index == 1 ? Color(0xFF1DB954) : Colors.white,
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
