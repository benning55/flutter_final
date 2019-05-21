    
import 'package:flutter/material.dart';
import 'Complete.dart';
import 'Profile.dart';
import 'TodoList.dart';
import 'LogIn.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int count = 0;
  int _currentIndex = 0;
  final List<Widget> _childern = [TodoList(), Complete(), Profile()];

  // @override
  // void initState(){
  //   getUserPreferences()
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //body
      //getTaskListView()
      body: _childern[_currentIndex],

      //bottomNav
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.list), title: new Text('Task')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.done_all), title: new Text('Complete')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text('Profile'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}