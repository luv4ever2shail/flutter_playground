import 'package:flutter/material.dart';
import 'package:flutter_playground/myscreen.dart';
import 'package:flutter_playground/setpassword.dart';
import 'package:flutter_playground/signuppage.dart';

// Example application:
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        canvasColor: Colors.white,
      ),
      title: 'Flutter Playground',
      home: Myyyscreeeeen(),
      routes: <String, WidgetBuilder>{
        '/recordtrip': (BuildContext context) => new SignUpPage(),
        '/setpassword': (BuildContext context) => new SetPassWord(),
      },
    );
  }
}
