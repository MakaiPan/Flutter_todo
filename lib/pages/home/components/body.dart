import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

import '../components/task_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> taskList = [
      Task(title: 'Buy dinner', state: TaskState.todo),
      Task(title: 'Clean room', state: TaskState.todo),
      Task(title: 'Call Alex', state: TaskState.done),
    ];
    return ListView(
      children: [
        TaskItem(taskList[0]),
        TaskItem(taskList[1]),
        TaskItem(taskList[2]),
      ],
    );
  }
}
