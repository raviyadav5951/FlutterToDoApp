import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/TaskData.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                taskTitle: taskdata.tasks[index].taskName,
                isChecked: taskdata.tasks[index].isDone,
                checkBoxCallback: (checkboxcallback) {
                  // setState(() {
                  //   widget.tasks[index].toggleDone();
                  // });
                });
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
