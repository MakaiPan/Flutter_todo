import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/models/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
  late double startDragPoint;
  void completeTask() {
    widget.task.done();
    widget.task.save();
  }

  void undoTask() {
    widget.task.reset();
    widget.task.save();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            spacing: 0.0,
            onPressed: (_) => widget.task.delete(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
        title: GestureDetector(
          onHorizontalDragDown: (details) {
            startDragPoint = details.localPosition.dx;
          },
          onHorizontalDragUpdate: (details) {
            if (widget.task.isNotDone &&
                details.localPosition.dx > startDragPoint + 50) {
              completeTask();
            }
            if (widget.task.isDone &&
                details.localPosition.dx < startDragPoint - 50) {
              undoTask();
            }
          },
          child: Text(
            widget.task.title,
            style: TextStyle(
              color: widget.task.isDone ? Colors.grey : Colors.black,
              decorationColor: Colors.grey,
              decorationStyle: TextDecorationStyle.solid,
              decoration: widget.task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontSize: kTextNormalSize,
            ),
          ),
        ),
      ),
    );
  }

  Container deleteWidget() {
    return Container(
      color: Colors.red,
      child: Wrap(
        alignment: WrapAlignment.end,
        runAlignment: WrapAlignment.center,
        spacing: 4.0,
        children: const [
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            'Delete Task',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: kTextNormalSize,
            ),
          ),
          SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
