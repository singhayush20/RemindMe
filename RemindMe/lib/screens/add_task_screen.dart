import 'package:flutter/material.dart';
import 'package:remindme/models/task_data.dart';
import 'package:remindme/models/task_model.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  // final void Function(dynamic, dynamic) addTaskCallback;
  // AddTaskScreen({required this.addTaskCallback});
  //Not required with the provider

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle = '';
  String newTaskDescp = '';
  @override
  Widget build(BuildContext context) {
    //MediaQueryData newMediaQueryData = MediaQueryData();
    return Container(
      color: Color(0xff757575),
      child: Container(
        //padding: EdgeInsets.only(bottom: newMediaQueryData.viewInsets.bottom),
        decoration: BoxDecoration(
          color: Colors.indigo[800],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Add a new Task!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                autofocus: true,
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.amber,
                decoration: const InputDecoration(
                  hintText: 'Enter Title',
                  hintStyle: TextStyle(
                    color: Colors.white60,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                ),
                onChanged: (newTitle) {
                  if (newTitle != null || newTitle.trim() != '') {
                    print(newTitle);

                    newTaskTitle = newTitle;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.amber,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter description',
                  hintStyle: TextStyle(
                    color: Colors.white60,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                ),
                onChanged: (newDescp) {
                  if (newDescp != null || newDescp.trim() != '') {
                    print(newDescp);

                    newTaskDescp = newDescp;
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent),
                ),
                onPressed: () {
                  print('Title: $newTaskTitle');
                  print('Descp: $newTaskDescp');
                  //Can't simply add, need to call the notifyListeners();
                  //Therefore make use of the method addTask of the TaskData class
                  // Provider.of<TaskData>(context).tasks.add(task);
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle, newTaskDescp, false);
                  Navigator.pop(context);
                  // if (newTaskTitle.trim() != '' && newTaskDescp.trim() != '') {
                  //   widget.addTaskCallback(newTaskTitle, newTaskDescp);
                  // } //not required with provider
                },
                child: const Text(
                  'Add to the list',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
