import 'package:flutter/material.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/models/Task.dart';

class TasksScreen extends StatefulWidget {

  
  // Widget  buildBottomSheet(BuildContext buildContext)=> Container();
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  BuildContext scaffoldContext;

  
  List<Task> tasks = [
    Task(taskName: 'Bring Bread', isDone: false),
    Task(taskName: 'Bring Egg', isDone: false),
    Task(taskName: 'Bring Butter', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 50.0, right: 30.0, left: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskList(
                tasks: tasks,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
          
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            context: context,
            builder: (BuildContext buildContext) => AddTaskScreen((newTitle) {
              setState(() {
                print(newTitle);
                tasks.add(Task(taskName: newTitle));
                print('tasks length=${tasks.length}');
              });
            }),
          );
        },
      ),
    );
  }
}
