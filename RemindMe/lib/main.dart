import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindme/screens/task_screen.dart';
import 'models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TaskData(); //ChangeNotifierProvider
        //at the very top of the widget tree provides
        //the TaskData() object to all the children that
        //want to listen to the changes.
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}
