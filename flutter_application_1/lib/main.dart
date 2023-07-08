// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/todo-card.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

//* StateFull Widget
class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  //*this the properties of tasks
  String title = "Unknown";
  bool status = false;
  //*we need to make a constructor
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoAppState extends State<TodoApp> {
  //*********Variables************/
  final myController = TextEditingController();
  String addTask = "unknown";
  List allTasks = [
    Task(title: "editing Sk video", status: true),
    Task(title: "learning flutter", status: true),
    Task(title: "work on online", status: false),
  ];
  //*********end of Variables************/
  //**********Function*****/
  void addNewTask() {
    addTask=myController.text;
    setState(() {
      allTasks.add(Task(title: addTask, status: false));
    });
  }
  //**********end of Function*****/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),
                backgroundColor: Color.fromARGB(255, 211, 238, 212),
                child: Container(
                  height:200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: TextField(
                            controller: myController,
                            decoration: InputDecoration(
                              fillColor: Colors.green,
                              hintText: "Write Your Task Here",
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            addNewTask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(fontSize: 28, color: Colors.green),
                          ))
                    ],
                  ),
                ),
              );
            },
          ); //end of show dialog sheet
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green[600],
      ),
      appBar: AppBar(
        elevation: 0.9,
        backgroundColor: Colors.green,
        title: Text(
          "Todo App",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TodoCard(),
              // TodoCard(),
              ...allTasks.map((item) => TodoCard(
                    checkStatus: item.status,
                    task: item.title,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
