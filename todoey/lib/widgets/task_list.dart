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
            final task = taskdata.tasks[index];
            return TaskTile(
              taskTitle: task.taskName,
              isChecked: task.isDone,
              checkBoxCallback: (checkboxstate) {
                taskdata.updateTask(task);
              },
              longPressCallback: () {
                taskdata.removeTask(task);
              },
            );
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
