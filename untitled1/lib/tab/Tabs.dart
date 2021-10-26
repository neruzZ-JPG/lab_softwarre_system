import 'package:flutter/material.dart';
import 'package:untitled1/common/HttpUtil.dart';
import 'package:untitled1/pages/Course.dart';
import 'package:untitled1/pages/Labs.dart';
import 'package:untitled1/pages/Softwares.dart';
import 'package:untitled1/pages/Teachers.dart';
import 'package:untitled1/pages/UserInfo/MyCourses.dart';
import 'package:untitled1/pages/UserInfo/MyLab.dart';
import 'package:untitled1/pages/login.dart';
import '../main.dart';
import '../pages/UserInfo/MyInfo.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List pageList = [CoursePage(0), LabPage(), SoftwarePage(), TeacherPage()];
  int current_index = 0;

  Widget getTitle() {
    switch (current_index) {
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

  Widget getDrawer() {
    return Drawer(
        child: ListView(

      children: [
        UserAccountsDrawerHeader(
            accountName: Text(user.user_name),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://bkimg.cdn.bcebos.com/pic/fc1f4134970a304eff144024d6c8a786c9175c3e?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg'),
            ),
            accountEmail: Text(user.user_phone_number)),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.people),
          ),
          title: Text('我的信息'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return UserDetailPage(user, 0);
            }));
          },
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.handyman_outlined),
          ),
          title: Text('实验室管理'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return MyLabPage();
            }));
          },
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.menu_book_outlined),
          ),
          title: Text('课程管理'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return MyCoursePage(0);
            }));
          },
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: getDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: getTitle(),
          //backgroundColor: Colors.white24,
          backgroundColor: Colors.amber,
          leading: RaisedButton(
            color: Colors.amber,
            child: Icon(Icons.assignment_return_outlined),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TextFieldAndCheckPage();
              }));
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
                  icon: Icon(Icons.book_outlined),
                  title: Text('course'),
                  backgroundColor: Colors.amber),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  title: Text('lab'),
                  backgroundColor: Colors.amber),
              BottomNavigationBarItem(
                  icon: Icon(Icons.computer_outlined),
                  title: Text('software'),
                  backgroundColor: Colors.amber),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("teacher"),
                  backgroundColor: Colors.amber)
            ]),
      ),
    ));
  }
}
