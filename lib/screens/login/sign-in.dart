import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../api/api-client.dart';

class SigninPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SigninPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Our app'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Buddies pro',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Register'),
                        onPressed: () async {
                          print(nameController.text);
                          print(passwordController.text);
                          String mailId = nameController.text;
                          String password = passwordController.text;
                          bool valid = mailId != null &&
                              password != null &&
                              mailId != '' &&
                              password != '';
                          if (valid) {
                            try {
                              await ApiClient.auth
                                  .createUserWithEmailAndPassword(
                                      email: mailId, password: password);
                              await ApiClient.auth.signInWithEmailAndPassword(
                                  email: mailId, password: password);
                              Navigator.pushReplacementNamed(context, '/home');
                            } catch (e) {
                              print(e);
                              showToast(e.toString(), gravity: Toast.BOTTOM);
                            }
                          }
                        },
                      )),
                ),
              ],
            )));
  }
}
