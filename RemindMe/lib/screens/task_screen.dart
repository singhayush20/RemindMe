import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import '../models/task_model.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(taskName: 'Task 1', taskdescp: 'Descp 1'),
    Task(taskName: 'Task 2', taskdescp: 'Descp 2'),
    Task(taskName: 'Task 3', taskdescp: 'Descp 3')
  ];
  /*This task list will be available down the widget tree in the task list and add task screen*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) =>
                AddTaskScreen(addTaskCallback: (newTaskTitle, newTaskDescp) {
              setState(() {
                tasks.add(
                  Task(taskName: newTaskTitle, taskdescp: newTaskDescp),
                );
                Navigator.pop(context);
              });
            }),
          );
        },
        backgroundColor: Colors.indigo[800],
        child: Icon(
          Icons.add,
          color: Colors.amber[400],
        ),
      ),
      backgroundColor: Colors.indigo[800],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    size: 30.0,
                    Icons.list,
                    color: Colors.indigoAccent[800],
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'RemindMe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TaskList(tasks: tasks),
              decoration: BoxDecoration(
                color: Colors.amber[400],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
