import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => new TodoListState();
}

class TodoListState extends State<TodoList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
          title: const Text("Todo"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.pushReplacementNamed(context, '/newSub'),
            )
          ],
        ),
        body: Center(
          child: new Text(
            "No data found..",
            textAlign: TextAlign.center,
          ),
        ),
    );
  }

}