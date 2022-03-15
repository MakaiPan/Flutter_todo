import 'package:flutter/material.dart';
import 'package:todo/components/horizontal_line.dart';
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
      widget.task.state =
          widget.task.state == TaskState.todo ? TaskState.done : TaskState.todo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: completeTask,
      child: ListTile(
        horizontalTitleGap: 0.0,
        title: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: Text(
                widget.task.title.substring(
                    0,
                    widget.task.state == TaskState.done
                        ? 0
                        : widget.task.title.length),
                style: const TextStyle(
                  color: Colors.transparent,
                  decorationColor: Colors.black,
                  decorationStyle: TextDecorationStyle.solid,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
            Text(widget.task.title),
          ],
        ),
      ),
    );
  }
}
