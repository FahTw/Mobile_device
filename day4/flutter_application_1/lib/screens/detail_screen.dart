import 'package:flutter/material.dart';
import '../models/todo.dart'; // Import Model

class DetailScreen extends StatelessWidget {
  final Todo todo;

  const DetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title), // เอาชื่อ Title มาแสดงหัวข้อ
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description), // เอา Description มาแสดง
      ),
    );
  }
}