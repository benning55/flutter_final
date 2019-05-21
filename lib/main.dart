import 'package:final_exam/ui/NewSubject.dart';
import 'package:final_exam/ui/Profile.dart';
import 'package:final_exam/ui/SignUp.dart';
import 'package:final_exam/ui/Wait.dart';
import 'package:flutter/material.dart';
import 'package:final_exam/ui/Home.dart';
import 'ui/LogIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFa1887f),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/wait',
      routes: {
        "/": (context) => LogIn(),
        "/signUp": (context) => SignUp(),
        "/home": (context) => Home(),
        "/newSub": (cintext) => NewSubject(),
        "/wait": (context) => Wait(),
        "/profile": (context) => Profile()
      },
    );
  }
}