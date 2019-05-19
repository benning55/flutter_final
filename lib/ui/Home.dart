    
import 'package:flutter/material.dart';
import 'Complete.dart';
import 'TodoList.dart';

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
  final List<Widget> _childern = [TodoList(), Complete()];

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
              icon: new Icon(Icons.done_all), title: new Text('Complete'))
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