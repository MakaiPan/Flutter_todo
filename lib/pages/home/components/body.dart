import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/models/task.dart';

import '../components/task_item.dart';
import '../components/new_task_tile.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box<Task>(kTaskBox).listenable(),
      builder: (context, box, widget) {
        return ListView(
          shrinkWrap: true,
          children: [
            for (Task task in box.values) TaskItem(task),
            const NewTaskTile(),
          ],
        );
      },
    );
  }
}
