import 'package:flutter/material.dart';
import 'package:untitled1/common/HttpUtil.dart';
import 'package:untitled1/entity/Course.dart';
import 'package:untitled1/entity/Major.dart';
import 'package:untitled1/pages/subPages/CourseDetailPage.dart';
import 'package:untitled1/pages/subPages/addCourse.dart';
import 'package:untitled1/tab/Tabs.dart';
import 'package:untitled1/utils/Request.dart';

import '../../main.dart';

List<Course> courses = new List<Course>();
int got = 0;
final ip = HttpUtil.ip;
final port = HttpUtil.port;

class MyCoursePage extends StatefulWidget {
  //CoursePage({Key key}) : super(key: key);

  MyCoursePage(int refresh) {
    got = refresh;
  }

  @override
  _coursePageState createState() => _coursePageState();
}

class _coursePageState extends State<MyCoursePage> {
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
                    color: Colors.white24,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CourseDetailPage(courses[index], 0)));
                    }),
              ],
            )
          ],
        ));
  }

  void setData(data) {
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
  }

  @override
  Widget build(BuildContext context) {
    if (got == 0) {
      Map<String, String> map = {"user_id": user.user_id.toString()};
      Request.getData("http://$ip:$port/getCoursesByUserId", setData,
          params: map);
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          centerTitle: true,
          leading: RaisedButton(
            child: Icon(Icons.chevron_left_rounded),
            color: Colors.brown,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Tabs();
              }));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
        ));
  }
}
