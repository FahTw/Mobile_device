import 'package:flutter/material.dart';
// ตรวจสอบ path import ให้ตรงกับโครงสร้างโปรเจกต์ของคุณ
import '/widgets/taskList.dart';
import '../models/task.dart';
import '/widgets/taskDialog.dart';
import '../services/task_db.dart';

void main() {
  runApp(const TaskListPage());
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});
  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> _tasks = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    setState(() {
      _isLoading = true;
    });
    // จำลองการดึงข้อมูล
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      // ตัวอย่างข้อมูล (ถ้ามี DB จริง ให้เอาส่วนนี้ออกและใช้ service แทน)
      if (_tasks.isEmpty) {
        _tasks = [
          Task(id: 1, title: 'Task 1', createdAt: DateTime.now()),
          Task(id: 2, title: 'Task 2', createdAt: DateTime.now()),
        ];
      }
      _isLoading = false;
    });
  }

  // ฟังก์ชันสำหรับรับค่ากลับมาจาก Dialog
  void _openAddDialog() async {
    // ใช้ await เพื่อรอจนกว่า Dialog จะปิด
    final newTask = await showDialog<Task?>(
      context: context,
      builder: (context) {
        return TaskDialog(
          task: Task(
            id: _tasks.length + 1,
            title: '',
            createdAt: DateTime.now(),
          ),
        );
      },
    );

    // ถ้ามีการส่งค่ากลับมา (กด Save) ให้เพิ่มลง List
    if (newTask != null) {
      setState(() {
        _tasks.add(newTask);
      });
    }
  }

  // ฟังก์ชันสำหรับแก้ไข Task ที่มีอยู่แล้ว
  void _openEditDialog(Task task) async {
    final editedTask = await showDialog<Task?>(
      context: context,
      builder: (context) {
        return TaskDialog(task: task);
      },
    );

    // ถ้ามีการแก้ไข ให้อัปเดต List
    if (editedTask != null) {
      setState(() {
        final index = _tasks.indexWhere((t) => t.id == task.id);
        if (index != -1) {
          _tasks[index] = editedTask;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // เอาป้าย debug มุมขวาออก
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Todo App",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 181, 204, 215),
          elevation: 0,
        ),
        body: Column(
          children: [
            // ส่วนหัว Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // จัดชิดซ้าย-ขวา
                children: [
                  const Text(
                    "Recent Tasks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                    ), // เปลี่ยนไอคอนให้ดูทันสมัยขึ้น
                    color: Colors.blue,
                    iconSize: 36, // ใหญ่ขึ้นนิดนึงเพื่อให้กดง่ายบนมือถือ
                    onPressed: _openAddDialog, // เรียกฟังก์ชันที่สร้างไว้
                  ),
                ],
              ),
            ),

            // ส่วน List รายการ
            // ต้องใช้ Expanded เพื่อให้ ListView รู้ว่าเหลือพื้นที่เท่าไหร่
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _tasks.isEmpty
                  ? const Center(child: Text("No tasks available."))
                  : ListView.builder(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ), // เว้นขอบล่างให้สกรอลได้สุด
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        final task = _tasks[index];
                        // ตรวจสอบว่า TaskList widget ของคุณรับ parameter ตามนี้จริงหรือไม่
                        return TaskList(
                          task: task,
                          onToggle: (updatedTask) {
                            setState(() {
                              task.isDone = !task.isDone;
                              // หรือ task.isDone = updatedTask.isDone; ขึ้นอยู่กับ implement
                            });
                          },
                          onDelete: (id) {
                            setState(() {
                              _tasks.removeWhere((t) => t.id == id);
                            });
                          },
                          onEdit: (taskToEdit) {
                            _openEditDialog(taskToEdit);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
        // แนะนำ: บนมือถือปุ่มเพิ่มงานมักจะใช้ FloatingActionButton (ถ้าชอบแบบนี้ก็ใช้ได้เลย)
        floatingActionButton: FloatingActionButton(
          onPressed: _openAddDialog,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
