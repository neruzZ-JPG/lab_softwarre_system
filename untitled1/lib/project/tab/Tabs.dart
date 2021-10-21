import 'package:flutter/material.dart';
import 'package:untitled1/project/pages/Course.dart';
import 'package:untitled1/project/pages/Labs.dart';
import 'package:untitled1/project/pages/Softwares.dart';
import 'package:untitled1/project/pages/Teachers.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List pageList = [CoursePage(), LabPage(), SoftwarePage(), TeacherPage()];
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('app01'),
                //backgroundColor: Colors.white24,
                backgroundColor: Colors.amber,
              ),
              body: this.pageList[this.current_index],
              bottomNavigationBar: BottomNavigationBar(
                fixedColor: Colors.deepOrange,
                currentIndex: this.current_index,
                onTap: (int index) {
                  setState(() {
                    this.current_index = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('course'), backgroundColor: Colors.amber),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), title: Text('lab'), backgroundColor: Colors.amber),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), title: Text('software'), backgroundColor: Colors.amber),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.ac_unit), title: Text("teacher"), backgroundColor: Colors.amber)
                ]),
            ),
        ));


  }
}