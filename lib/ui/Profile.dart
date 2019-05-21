import 'package:flutter/material.dart';
import 'LogIn.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => new ProfileState();
}

class ProfileState extends State<Profile>{
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
            "$_id",
            textAlign: TextAlign.center,
          ),
        ),
    );
  }

  void updateId(int id) {
    setState(() {
     this._id = id; 
    });
  }

}

class _name {
}