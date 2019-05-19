import 'package:flutter/material.dart';

class Complete extends StatefulWidget {
  @override
  CompleteState createState() => new CompleteState();
}

class CompleteState extends State<Complete>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
          title: const Text("Todo"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => {},
            )
          ],
        ),
        body: Center(
          child: new Text(
            "No data Complete",
            textAlign: TextAlign.center,
          ),
        ),
    );
  }

}