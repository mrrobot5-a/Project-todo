// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {

//! Variable for  Class 
String task="unknown";
bool checkStatus=false;
//* Constructor 
TodoCard({required this.task, required this.checkStatus});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        width: double.infinity,
        // ignore: prefer_const_constructors
        margin: EdgeInsets.fromLTRB(5, 25, 5, 0),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 127, 238, 130),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(children: [
          Text(
            task,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
               
            },
            
            icon: (checkStatus)?
            Icon(Icons.check,color: Colors.green[600],size: 35,):
            Icon(Icons.close,color: Colors.red,size: 35,)
          ),
        ]),
      ),
    );
  }
}
