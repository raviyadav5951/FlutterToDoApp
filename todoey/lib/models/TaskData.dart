
import 'package:flutter/foundation.dart';
import 'Task.dart';

class TaskData extends ChangeNotifier{

   List<Task> tasks = [
    Task(taskName: 'Bring Bread', isDone: false),
    Task(taskName: 'Bring Egg', isDone: false),
    Task(taskName: 'Bring Butter', isDone: false),
  ];

  int get taskCount{
    return tasks.length;
  }

}