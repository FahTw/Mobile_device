import 'package:flutter/material.dart';
import 'pages/post_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Post Reader',
      theme: ThemeData(useMaterial3: true),
      home: const PostListPage(),
    );
  }
}