import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'detail_screen.dart'; // Import หน้าปลายทาง

class NavigateScreen extends StatelessWidget {
  const NavigateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. ดึงข้อมูลจำลองมาจาก Model
    final List<Todo> todos = Todo.generateTodos();

    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          // เก็บข้อมูลตัวปัจจุบันไว้ในตัวแปร
          final currentTodo = todos[index];

          return ListTile(
            title: Text(currentTodo.title),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            // --- Logic การเปลี่ยนหน้า ---
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // ส่ง currentTodo ไปให้หน้า Detail
                  builder: (context) => DetailScreen(todo: currentTodo),
                ),
              );
            },
          );
        },
      ),
    );
  }
}