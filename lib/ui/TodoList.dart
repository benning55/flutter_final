import 'package:flutter/material.dart';

import 'LogIn.dart';

class TodoList extends StatefulWidget {

  @override
  TodoListState createState() => new TodoListState();
}

class TodoListState extends State<TodoList>{
  String _name = '';
  int _id;

  @override
  void initState(){
    LogInState user = new LogInState();
    user.getUserPreferences().then((int id){
      updateId(id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
          title: const Text("Home"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.pushReplacementNamed(context, '/newSub'),
            )
          ],
        ),
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(

                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text("PROFILE SETUP"),
                      onPressed: () async {}
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text("MY FRIENDS"),
                      onPressed: () async {}
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text("SIGN OUT"),
                      onPressed: () async {}
                    ),
                  )
                ],
              ),
            ),
          )
        ),
    );
  }

  void updateId(int id) {
    setState(() {
     this._id = id; 
    });
  }

}