class Task {
  Task({
    required this.title,
    this.state = TaskState.todo,
    this.detail = '',
  });

  TaskState state;
  String title;
  String detail;
  // The time when the task was created and cannot be modified.
  final DateTime _createTime = DateTime.now();
  late DateTime completeTime;

  DateTime get createTime => _createTime;
}

enum TaskState {
  todo,
  done,
}
