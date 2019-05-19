import 'package:final_exam/ui/NewSubject.dart';
import 'package:final_exam/ui/SignUp.dart';
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
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => LogIn(),
        "/signUp": (context) => SignUp(),
        "/home": (context) => Home(),
        "/newSub": (cintext) => NewSubject()
      },
    );
  }
}