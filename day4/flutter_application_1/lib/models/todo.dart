class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);

  // Helper Method: สร้างข้อมูลจำลอง 20 ตัว (Static Method)
  // เรียกใช้โดยพิมพ์ Todo.generateTodos()
  static List<Todo> generateTodos() {
    return List.generate(
      20,
      (i) => Todo(
        'Todo $i',
        'รายละเอียดของงานที่ $i ต้องทำให้เสร็จภายในวันนี้...',
      ),
    );
  }
}