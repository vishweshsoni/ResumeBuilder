import 'package:flutter/material.dart';
import 'package:resume_app/screens/educationdetails1.dart';
import 'package:resume_app/screens/homepage.dart';
import 'package:resume_app/screens/login.dart';
import 'package:resume_app/screens/educationdetails.dart';
import 'package:resume_app/screens/signup.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  bool isLogin = true;
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
          '/SignupPage':(context)=>SignUp(),
           '/PersonalDetails':(context)=>EducationDetails1(),

      },
      home: isLogin?Login():SignUp(),
    );
  }
}
