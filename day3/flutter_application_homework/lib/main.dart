import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
      ),
      home: const MyHomePage(title: 'กำลังเล่นเพลง'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 20.0;
  final double _maxValue = 100;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (AppBar)
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Center(
                    child: Image(
                      image: AssetImage('assets/image/bg2.jpg'),

                      width: 250,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                'เธอยูนีค',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const Spacer(),

                            const Icon(Icons.add_circle, color: Colors.white),
                          ],
                        ),
                        const Text('WatcharaWalee'),
                        Column(
                          children: [
                            Slider(
                              value: _currentSliderValue,
                              min: 0,
                              max: _maxValue,
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                        
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // ใช้ฟังก์ชัน formatTime() หรือการคำนวณเวลาที่ถูกต้อง
                                    '${(_currentSliderValue * 3 / _maxValue).toStringAsFixed(2).replaceAll('.', ':')}',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const Text(
                                    '3:36',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                          
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.shuffle, color: Colors.white),
                              Icon(Icons.skip_previous, color: Colors.white),

                              if (isPlaying)
                                IconButton(
                                  icon: Icon(
                                    Icons.pause_circle_filled,
                                    color: Colors.white,  
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPlaying = false;
                                    });
                                  },
                                )
                              else
                                IconButton(
                                  icon: Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.white,  
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPlaying = true;
                                    });
                                  },
                                ),

                              Icon(Icons.skip_next, color: Colors.white),
                              Icon(Icons.repeat, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
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
