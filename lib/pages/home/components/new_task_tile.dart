import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/models/task.dart';

class NewTaskTile extends StatefulWidget {
  const NewTaskTile({
    Key? key,
  }) : super(key: key);

  @override
  State<NewTaskTile> createState() => _NewTaskTileState();
}

class _NewTaskTileState extends State<NewTaskTile> {
  String text = '';
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      child: TextField(
        focusNode: focusNode,
        decoration: const InputDecoration(
          hintText: 'Add a Task',
          border: InputBorder.none,
        ),
        onChanged: (inputText) {
          text = inputText;
        },
        onEditingComplete: () {
          Task task = Task(title: text);
          var box = Hive.box<Task>(kTaskBox);
          box.add(task);
          focusNode.unfocus();
        },
      ),
    );
  }
}
