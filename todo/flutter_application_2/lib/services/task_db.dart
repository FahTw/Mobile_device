import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/task.dart';

class TaskDb {
  static final TaskDb instance = TaskDb._init();
  static Database? _database;

  TaskDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        isDone BOOLEAN NOT NULL
      )
    ''');
  }

  Future<int> createTask(Task task) async {
    final db = await database;
    return await db.insert('tasks', {
      'title': task.title,
      'createdAt': task.createdAt.toIso8601String(),
    });
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final result = await db.query('tasks', orderBy: 'createdAt DESC');

    return result
        .map(
          (json) => Task(
            id: json['id'] as int,
            title: json['title'] as String,
            createdAt: DateTime.parse(json['createdAt'] as String),
            isDone: (json['isDone'] as int) == 1,
          ),
        )
        .toList();
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return await db.update(
      'tasks',
      {'title': task.title, 'isDone': task.isDone ? 1 : 0},
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
