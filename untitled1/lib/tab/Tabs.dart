import 'package:flutter/material.dart';
import 'package:untitled1/pages/Course.dart';
import 'package:untitled1/pages/Labs.dart';
import 'package:untitled1/pages/Softwares.dart';
import 'package:untitled1/pages/Teachers.dart';


class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List pageList = [CoursePage(0), LabPage(), SoftwarePage(), TeacherPage()];
  int current_index = 0;

  Widget getTitle(){
    switch(current_index){
      case 0:
        return Text("课程");
        break;
      case 1:
        return Text("实验室");
        break;
      case 2:
        return Text("软件");
        break;
      case 3:
        return Text("老师");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: getTitle(),
                //backgroundColor: Colors.white24,
                backgroundColor: Colors.amber,
                leading: RaisedButton(
                  color: Colors.amber,
                  child:Icon(Icons.assignment_return_outlined),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
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
                      icon: Icon(Icons.book_outlined), title: Text('course'), backgroundColor: Colors.amber),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded), title: Text('lab'), backgroundColor: Colors.amber),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.computer_outlined), title: Text('software'), backgroundColor: Colors.amber),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), title: Text("teacher"), backgroundColor: Colors.amber)
                ]),
            ),
        ));


  }
}