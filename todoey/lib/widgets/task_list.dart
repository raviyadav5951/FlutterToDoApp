import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/Task.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(taskName: 'Bring Bread', isDone: false),
    Task(taskName: 'Bring Egg', isDone: false),
    Task(taskName: 'Bring Butter', isDone: false),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: tasks[index].taskName,
            isChecked: tasks[index].isDone,
            checkBoxCallback: (checkboxcallback) {
              setState(() {
                tasks[index].isDone;
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}
