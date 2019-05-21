import 'package:final_exam/dbms/DatabaseManage.dart';
import 'package:final_exam/models/Users.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LogIn.dart';

class Wait extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WaitState();
  }
}

class WaitState extends State {
  List<Users> items = new List();
  LogInState user = new LogInState();

  DatabaseManage db = DatabaseManage();
  @override
  Future initState() {
    super.initState();
    print(user.getUserPreferences().toString());
    _read();
  }

  _read() async {
        final prefs = await SharedPreferences.getInstance();
        final key = 'my_int_key';
        final value = prefs.getInt(key) ?? 0;
        print('read: $value');
      }

  // Future<String> getLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final stateLogin = prefs.get('user') ?? 0;
  //   print(stateLogin);
  //   if (stateLogin != 0) {
  //     print("Alrady login");
  //     var dataUser =
  //         items.singleWhere((i) => i.id == stateLogin, orElse: () => null);
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) => MainHome(dataUser, items)));
  //   } else {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => LoginForm(items)));
  //   }
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
