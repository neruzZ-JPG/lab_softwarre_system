import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled1/project/common/HttpUtil.dart';
import 'package:untitled1/project/entity/Course.dart';
import 'package:untitled1/project/entity/Major.dart';
import 'package:untitled1/project/utils/Request.dart';

List <Course> courses = new List<Course>();
int got = 0;

class CoursePage extends StatefulWidget {
  CoursePage({Key key}) : super(key: key);

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
              subtitle: Text(courses[index].major == null ? "null" : courses[index].major.major_name),
              ),
            ],
        ));
  }

  @override
  Widget build(BuildContext context) {

    final ip = HttpUtil.ip;
    final port = HttpUtil.port;
    if(got == 0) {
      Request.getData("http://$ip:$port/getAllCourses", (data) {
        setState(() {
          var list = data['data'] as List;
          courses = list.map((i) => Course.fromJson(i)).toList();
          got = 1;
          print(courses);
          for(Course course in courses){
            Map<String, String>map = {"major_id":course.major_id.toString()};
            Request.getData("http://$ip:$port/getMajorById",(data){
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
          Expanded(child: GridView.builder(
            itemCount: courses.length,
            itemBuilder: this._getData,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 4.0,
              crossAxisCount: 1,
              crossAxisSpacing: 10.0, //水平距离
              mainAxisSpacing: 20.0, //上下距离
            ),
          )
          )
        ],
      ),
    );
  }
}