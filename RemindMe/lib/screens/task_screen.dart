import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import '../models/task_model.dart';
import 'package:provider/provider.dart';
import 'package:remindme/models/task_data.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  /*This task list will be available down the widget tree in the task list and add task screen*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
            //Using the callback
            //     AddTaskScreen(addTaskCallback: (newTaskTitle, newTaskDescp) {
            //   // setState(() {
            //   //   tasks.add(
            //   //     Task(taskName: newTaskTitle, taskdescp: newTaskDescp),
            //   //   );
            //   //   Navigator.pop(context);
            //   // });
            // }),
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
                const Text(
                  'RemindMe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  //instead of .tasks.length} we can use the taskCount
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
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
              child: TaskList(),
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
