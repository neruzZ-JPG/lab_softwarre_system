import 'package:flutter/material.dart';
import 'package:untitled1/common/HttpUtil.dart';
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
          '/labs' : (context) => LabPage(0),
          '/courses' : (context) => CoursePage(0),
          '/softwares' : (context) => SoftwarePage(0),
          '/teachers' : (context) => TeacherPage(0),
          '/tab' : (context) => Tabs(),
        },
    );
  }
}