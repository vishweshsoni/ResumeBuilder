import 'package:flutter/material.dart';
import 'package:resume_app/screens/homepage.dart';
import 'package:resume_app/screens/login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Resume Builder',
      theme: ThemeData(
                primarySwatch: Colors.lightBlue,
      ),
      routes: {
          '/HomePage': (context)=>HomePage(),
      },
      home: Login(),
    );
  }
}
