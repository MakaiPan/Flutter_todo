import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
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
    // setState(() {
    widget.task.state = TaskState.done;
    widget.task.completeTime = DateTime.now();
    widget.task.save();
    // });
  }

  void undoTask() {
    // setState(() {
    widget.task.state = TaskState.todo;
    widget.task.completeTime = null;
    widget.task.save();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AnimatedSize(
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
                fontSize: kTextNormalSize,
              ),
            ),
          ),
        ),
        Dismissible(
          key: UniqueKey(),
          child: GestureDetector(
            child: ListTile(
              horizontalTitleGap: 0.0,
              title: Text(
                widget.task.title,
                style: TextStyle(
                  color: widget.task.state == TaskState.todo
                      ? Colors.black
                      : Colors.grey,
                  fontSize: kTextNormalSize,
                ),
              ),
            ),
            onTap: widget.task.state == TaskState.todo ? completeTask : null,
            onDoubleTap: widget.task.state == TaskState.done ? undoTask : null,
          ),
          background: Container(
            color: Colors.red,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => widget.task.delete(),
        ),
      ],
    );
  }
}
