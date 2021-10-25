import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:untitled1/common/HttpUtil.dart';
import 'package:untitled1/entity/Department.dart';
import 'package:untitled1/entity/User.dart';
import 'package:untitled1/utils/Request.dart';


List<User> users = new List<User>();
Map map = new HashMap();
int got = 0;

class TeacherPage extends StatefulWidget {
  TeacherPage({Key key}) : super(key: key);

  @override
  _teacherPageState createState() => _teacherPageState();
}

class _teacherPageState extends State<TeacherPage> {
  Widget _getData(context, index) {
    // return Container(
    //   child: Text(softwares[index].software_name),
    //   color: Colors.blue,
    //
    // );
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text(users[index].user_name),
              subtitle: Text(users[index].department == null
                  ? "123"
                  : users[index].department.department_name),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final ip = HttpUtil.ip;
    final port = HttpUtil.port;
    if (got == 0) {
      Request.getData("http://$ip:$port/getAllUsers", (data) {
        setState(() {
          var list = data['data'] as List;
          List<User> tags = new List();
          users = list.map((i) => User.fromJson(i)).toList();
          got = 1;
          print(users);
          for (User user in users) {
            print(user.department_id);
            Map<String, String> map = {
              "department_id": user.department_id.toString()
            };
            Request.getData(
                "http://$ip:$port/getDepartmentById",
                (data) {
                  setState(() {
                    print(data);
                    user.setDeparment(Department.fromJson(data['data']));
                    print(user.department.department_name);
                  });
                },
                params: map,
                errorCallBack: (data) {
                  print("fail");
                });
          }
        });
      });
    }
    return Scaffold(
        body: Column(
      children: [
        RaisedButton(
          color: Colors.orangeAccent,
            child:Text("刷新")
            ,onPressed: () {
          setState(() {
            got = 0;
          });
        }),
        Expanded(
            child: GridView.builder(
              itemCount: users.length,
              itemBuilder: this._getData,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 5.0,
                crossAxisCount: 1,
                crossAxisSpacing: 10.0, //水平距离
                mainAxisSpacing: 20.0, //上下距离
              ),
            )),
      ],
    ));
  }
}
