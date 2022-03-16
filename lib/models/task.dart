import 'package:hive/hive.dart';

part 'task.g.dart';

const kTaskBox = 'task_box';

@HiveType(typeId: 0)
class Task with HiveObjectMixin {
  Task({
    required this.title,
    this.state = TaskState.todo,
    this.detail = '',
  });
  @HiveField(0)
  TaskState state;

  @HiveField(1)
  String title;

  @HiveField(2)
  String detail;

  // The time when the task was created and cannot be modified.
  @HiveField(3)
  final DateTime _createTime = DateTime.now();

  @HiveField(4)
  DateTime? completeTime;

  DateTime get createTime => _createTime;

  bool get isDone => state == TaskState.done;
  bool get isNotDone => state != TaskState.done;

  void done() {
    state = TaskState.done;
    completeTime = DateTime.now();
  }

  void reset() {
    state = TaskState.todo;
    completeTime = null;
  }
}

@HiveType(typeId: 1)
enum TaskState {
  @HiveField(1)
  todo,

  @HiveField(2)
  done,
}
