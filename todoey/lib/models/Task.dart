
class Task{

  final String taskName;
   bool isDone;

  Task({this.taskName,this.isDone});

  void toggleDone(){
    isDone=!isDone;
  }

}