import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  final String title; // เพิ่มตัวแปรรับค่า title

  const MusicScreen({super.key, required this.title});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  // ย้ายตัวแปรมาไว้ใน State
  double _currentSliderValue = 20.0;
  final double _maxValue = 100;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        // ใช้ widget.title เพื่อดึงค่าจาก class หลัก
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView( // ป้องกัน overflow บนจอเล็ก
        child: Column(
          children: [
            // ส่วนแสดงรูปหน้าปก
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: 
                  Image.network(
                    "https://cdn-images.dzcdn.net/images/cover/5756372aa8717c4ece0dc37268327d75/500x500-000000-80-0-0.jpg",
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // ส่วนข้อมูลเพลง
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'เธอยูนีค',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Text(
                    'WatcharaWalee',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  
                  const SizedBox(height: 30),

                  // Slider แถบเล่นเพลง
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: _maxValue,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white24,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),

                  // เวลาเพลง
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "0:${(_currentSliderValue.toInt()).toString().padLeft(2, '0')}",
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        const Text(
                          '3:36',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ปุ่มควบคุมการเล่นเพลง
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.shuffle, color: Colors.white54, size: 28),
                      const Icon(Icons.skip_previous, color: Colors.white, size: 45),
                      IconButton(
                        iconSize: 80,
                        icon: Icon(
                          isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                      const Icon(Icons.skip_next, color: Colors.white, size: 45),
                      const Icon(Icons.repeat, color: Colors.white54, size: 28),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}