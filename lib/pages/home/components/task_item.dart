import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class TaskItem extends StatefulWidget {
  const TaskItem(
    this.task, {
    Key? key,
  }) : super(key: key);

  final Task task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  void completeTask() {
    setState(() {
      widget.task.state = TaskState.done;
      widget.task.completeTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.task.state == TaskState.todo ? completeTask : null,
      child: ListTile(
        horizontalTitleGap: 0.0,
        title: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Text(
              widget.task.title,
              style: TextStyle(
                color: widget.task.state == TaskState.todo
                    ? Colors.black
                    : Colors.grey,
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: Text(
                widget.task.title.substring(
                    0,
                    widget.task.state == TaskState.todo
                        ? 0
                        : widget.task.title.length),
                style: const TextStyle(
                  color: Colors.transparent,
                  decorationColor: Colors.grey,
                  decorationStyle: TextDecorationStyle.solid,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
