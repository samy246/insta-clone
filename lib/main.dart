import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'insta_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
      (value) => print('==========> value ${value.options.androidClientId}'));
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Buddies Pro',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            buttonColor: Colors.black,
            primaryIconTheme: IconThemeData(color: Colors.black),
            primaryTextTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.black, fontFamily: "Aveny")),
            textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
        home: new InstaHome(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => InstaHome(),
        });
  }
}
