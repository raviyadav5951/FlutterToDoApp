import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/TaskData.dart';

class AddTaskScreen extends StatelessWidget {
  static String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            autofocus: false,
            cursorColor: Colors.lightBlueAccent,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
              print('Value from field=$newTaskTitle');
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          FlatButton(
            color: Colors.lightBlueAccent,
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              print('New Task title==$newTaskTitle');
              if (newTaskTitle != null && newTaskTitle.isNotEmpty) {
                Provider.of<TaskData>(context).addTask(newTaskTitle);
                Navigator.pop(context);
              } else {
                Fluttertoast.showToast(
                    msg: 'Please add value in todo task',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
          ),
        ],
      ),
    );
  }
}
