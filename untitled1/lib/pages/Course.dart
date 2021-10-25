import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled1/common/HttpUtil.dart';
import 'package:untitled1/entity/Course.dart';
import 'package:untitled1/entity/Major.dart';
import 'package:untitled1/pages/subPages/CourseDetailPage.dart';
import 'package:untitled1/pages/subPages/addCourse.dart';
import 'package:untitled1/utils/Request.dart';

import '../main.dart';

List<Course> courses = new List<Course>();
int got = 0;
final ip = HttpUtil.ip;
final port = HttpUtil.port;

class CoursePage extends StatefulWidget {
  //CoursePage({Key key}) : super(key: key);

  CoursePage(int refresh){
    got = refresh;
  }

  @override
  _coursePageState createState() => _coursePageState();
}

class _coursePageState extends State<CoursePage> {
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
              title: Text(courses[index].course_name),
              subtitle: Text(courses[index].major == null
                  ? "null"
                  : courses[index].major.major_name),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    child: Text("详情"),
                    color: Colors.limeAccent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CourseDetailPage(courses[index], 0)));
                    }),
                user.user_role == HttpUtil.role_admin
                    ? RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          Map<String, String> map = {
                            "course_id": courses[index].course_id.toString()
                          };
                          Request.postData("http://$ip:$port/deleteCourseById",
                              (data) {
                            print(data.toString());
                          }, params: map);
                          setState(() {
                            got = 0;
                          });
                        },
                        child: Text("删除"),
                      )
                    : Container(),
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (got == 0) {
      Request.getData("http://$ip:$port/getAllCourses", (data) {
        setState(() {
          var list = data['data'] as List;
          courses = list.map((i) => Course.fromJson(i)).toList();
          got = 1;
          print(courses);
          for (Course course in courses) {
            Map<String, String> map = {"major_id": course.major_id.toString()};
            Request.getData("http://$ip:$port/getMajorById", (data) {
              setState(() {
                Major major = Major.fromJson(data["data"]);
                print(major.major_name);
                course.major = major;
              });
            }, params: map);
          }
        });
      });
    }
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: user.user_role == HttpUtil.role_admin
            ? () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCoursePage()));
              }
            : () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("只有管理员可以进行该操作~"),
                        ));
              },
        child: new Text('添加'),
      ),
      body: Column(
        children: [
          RaisedButton(
              color: Colors.orangeAccent,
              child: Text("刷新"),
              onPressed: () {
                setState(() {
                  got = 0;
                });
              }),
          Expanded(
              child: GridView.builder(
            itemCount: courses.length,
            itemBuilder: this._getData,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3.0,
              crossAxisCount: 1,
              crossAxisSpacing: 10.0, //水平距离
              mainAxisSpacing: 20.0, //上下距离
            ),
          ))
        ],
      ),
    );
  }
}
