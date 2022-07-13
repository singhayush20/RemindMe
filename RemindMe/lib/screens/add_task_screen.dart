import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final void Function(dynamic, dynamic) addTaskCallback;
  AddTaskScreen({required this.addTaskCallback});

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
          padding: EdgeInsets.all(10),
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
                style: TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.amber,
                decoration: InputDecoration(
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
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
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
                  if (newTaskTitle.trim() != '' && newTaskDescp.trim() != '') {
                    widget.addTaskCallback(newTaskTitle, newTaskDescp);
                  }
                },
                child: Text(
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
