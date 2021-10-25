import 'package:flutter/material.dart';
import 'package:untitled1/pages/Course.dart';

import 'pages/Teachers.dart';
import 'pages/Labs.dart';
import 'pages/login.dart';
import 'pages/Softwares.dart';
import 'tab/Tabs.dart';
import 'entity/User.dart';

User user = new User(user_name:"no");

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TextFieldAndCheckPage(),
        routes:{
          '/login' : (context) => TextFieldAndCheckPage(),
          '/labs' : (context) => LabPage(),
          '/courses' : (context) => CoursePage(0),
          '/softwares' : (context) => SoftwarePage(),
          '/teachers' : (context) => TeacherPage(),
          '/tab' : (context) => Tabs(),
        },
    );
  }
}