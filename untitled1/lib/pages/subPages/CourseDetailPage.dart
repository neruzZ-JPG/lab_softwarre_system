import 'package:flutter/material.dart';
import 'package:untitled1/entity/Course.dart';
import 'package:untitled1/entity/Software.dart';

import '../../main.dart';
import '../../common/HttpUtil.dart';
import '../../utils/Request.dart';
import 'changeCourse.dart';

final String ip = HttpUtil.ip;
final String port = HttpUtil.port;

Course inCourse;
List<Software> softwares = new List<Software>();
int got = 0;

class CourseDetailPage extends StatefulWidget {
  CourseDetailPage(Course course, int refresh) {
    inCourse = course;
    got = refresh;
  }

  @override
  _CourseDetailState createState() => new _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailPage> {
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
              title: Text(softwares[index].software_name),
              subtitle: Text(softwares[index].catogory_id.toString()),
              //trailing: Text(softwares[index].software_need == null ? "null" : softwares[index].software_need),
            )
          ],
        ));
  }

  Course course = inCourse;

  @override
  Widget build(BuildContext context) {
    DataTable table = TableBuilder(course: course).buildTable();
    Map<String, String> map = {"course_id": course.course_id.toString()};
    if(got == 0){
      Request.getData("http://$ip:$port/getSoftwaresNeededByCourse", (data) {
        setState(() {
          var list = data['data'] as List;
          softwares = list.map((i) => Software.fromJson(i)).toList();
          print(softwares);
        });
      }, params: map);
      got = 1;
    }


    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(course.course_name),
          leading: RaisedButton(
              child: Text("<<<"),
              color: Colors.deepOrangeAccent,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(16),
                child: Align(
                  child: table,
                )),
            Expanded(
                child: GridView.builder(
              itemCount: softwares.length,
              itemBuilder: this._getData,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 5.0,
                crossAxisCount: 1,
                crossAxisSpacing: 10.0, //水平距离
                mainAxisSpacing: 20.0, //上下距离
              ),
            )),
            user.user_role == HttpUtil.role_admin
                ? RaisedButton(
                    child: Text("修改"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeCoursePage(course)));
                    })
                : Container()
          ],
        ));
  }
}

class TableBuilder {
  final Course course;

  TableBuilder({this.course});

  DataTable buildTable() {
    return new DataTable(columns: [
      DataColumn(label: Text("")),
      DataColumn(label: Text(""))
    ], rows: [
      DataRow(cells: [
        DataCell(Text("课程id")),
        DataCell(Text(course.course_id.toString()))
      ]),
      DataRow(cells: [
        DataCell(Text("专业名")),
        DataCell(Text(course.major.major_name)),
      ]),
      DataRow(
          cells: [DataCell(Text("学期")), DataCell(Text(course.course_term))]),
      DataRow(cells: [
        DataCell(Text("学时")),
        DataCell(Text(course.course_hours.toString()))
      ]),
      DataRow(cells: [
        DataCell(Text("课程容量")),
        DataCell(Text(course.course_hold.toString()))
      ]),
      DataRow(cells: [
        DataCell(Text("每班容量")),
        DataCell(Text(course.course_class_hold.toString()))
      ]),
    ]);
  }
}
