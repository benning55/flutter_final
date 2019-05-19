import 'package:final_exam/dbms/DatabaseManage.dart';
import 'package:final_exam/models/Users.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final _formKey = new GlobalKey<FormState>();
  
  final _nameControl = new TextEditingController();
  final _usernameControl = new TextEditingController();
  final _passwordControl = new TextEditingController();
  final _repasswordControl = new TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
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
                  TextFormField(
                    controller: _nameControl,
                    decoration: InputDecoration(
                      labelText: "NAME",
                      hintText: "Please enter your name",
                      icon: Icon(Icons.person)
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validator: (value){},
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
                  TextFormField(
                    controller: _repasswordControl,
                    decoration: InputDecoration(
                      labelText: "RE-PASSWORD",
                      hintText: "Please enter your re-password",
                      icon: Icon(Icons.https)
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value){},
                  ),
                  RaisedButton(
                    child: Text("SIGN-UP"),
                    onPressed: () async {
                      _formKey.currentState.validate();
                      if(_nameControl.text.isEmpty || _usernameControl.text.isEmpty || _passwordControl.text.isEmpty){
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Error",
                          desc: "Please Enter all form.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "OK",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                      else if (_passwordControl.text != _repasswordControl.text){
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Error",
                          desc: "Your password and repassword is not the same.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "OK",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                      else{
                        DatabaseManage db = new DatabaseManage();
                        bool state = true;
                        var x = await db.getAllUser();
                        for(int i = 0; i < x.length; i++){
                          debugPrint(x[i].username);
                          if(x[i].username == _usernameControl.text){
                            state = false;
                          }
                        }
                        if(state == false){
                            Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Error",
                            desc: "This username had used",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        }
                        else{
                          Users test = new Users();
                          test.setValue(_nameControl.text, _usernameControl.text, _passwordControl.text);
                          db.createNewUser(test);
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "Success",
                            desc: "You successfully sign up.",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                                width: 120,
                              )
                            ],
                          ).show();
                        }
                        debugPrint(x.length.toString());
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}