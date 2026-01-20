import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDialog extends StatefulWidget {
  final Task task;
  const TaskDialog({super.key, required this.task});

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task.title.isEmpty ? 'เพิ่มรายการ' : 'แก้ไขรายการ'),
      content: TextField(
        controller: _titleController,
        autofocus: true,
        decoration: const InputDecoration(hintText: "สิ่งที่ต้องทำ..."),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('ยกเลิก'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty) {
              widget.task.title = _titleController.text;
              Navigator.pop(context, widget.task); // ส่งค่า Task กลับไป
            }
          },
          child: const Text('บันทึก'),
        ),
      ],
    );
  }
}
