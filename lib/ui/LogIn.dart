import 'package:final_exam/dbms/DatabaseManage.dart';
import 'package:final_exam/models/Users.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogInState();
  }
}

class LogInState extends State<LogIn> {


  final _formKey = GlobalKey<FormState>();

  final _usernameControl = new TextEditingController();
  final _passwordControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "resources/ben10.jpg",
                    height: 200,
                  ),
                  TextFormField(
                    controller: _usernameControl,
                    decoration: InputDecoration(
                      labelText: "USERNAME",
                      hintText: "Please enter your usename",
                      icon: Icon(Icons.person)
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validator: (value){},
                  ),
                  TextFormField(
                    controller: _passwordControl,
                    decoration: InputDecoration(
                      labelText: "PASSWORD",
                      hintText: "Please enter your password",
                      icon: Icon(Icons.https)
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value){},
                  ),
                  SizedBox(
                    width: double.infinity,
      
                    child: RaisedButton(
                      child: Text("LOGIN"),
                      onPressed: () async {
                        _formKey.currentState.validate();
                        if(_usernameControl.text.isEmpty || _passwordControl.text.isEmpty){
                          Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Error",
                            desc: "Please enter all username and password.",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "ok",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        }else{
                          List<Users> test = new List();
                          DatabaseManage db = new DatabaseManage();
                          var users = await db.getLogInUser(_usernameControl.text, _passwordControl.text);               
                          debugPrint(users[0].id.toString());
                          debugPrint(users[0].username);
                          debugPrint(users[0].name);
                          if(users == null){
                              Alert(
                              context: context,
                              type: AlertType.error,
                              title: "Error",
                              desc: "Username and Password not correct or User not in system.",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "ok",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                )
                              ],
                            ).show();
                            debugPrint('You almost there');
                          }else{
                            int u_id = users[0].id;
                            //prefs.remove('user');
                            saveUser(u_id);
                          }
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          new TextSpan(
                            text: "Don't have any account?",
                            style: new TextStyle(color: Colors.blue),
                            recognizer: new TapGestureRecognizer()
                            ..onTap = (){
                              Navigator.pushReplacementNamed(context, '/signUp');
                            }
                          )
                        ]
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> saveUserPreference(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("ID", id);
    return prefs.commit();
  }

  Future<int> getUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int user_id = prefs.getInt("ID");
    return user_id;
  }

  void saveUser(int id) {
    saveUserPreference(id).then((bool committed){
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }
  

}