import 'package:flutter/material.dart';
import 'package:untitled1/common/HttpUtil.dart';
import 'package:untitled1/entity/Course.dart';
import 'package:untitled1/entity/Major.dart';

import '../../utils/Request.dart';

int got = 0;
String ip = HttpUtil.ip;
String port = HttpUtil.port;
List<Major> majors;
List<DropdownMenuItem> menu = new List<DropdownMenuItem>();

class AddCoursePage extends StatefulWidget {
  @override
  _addCoursePageState createState() => new _addCoursePageState();
}

class _addCoursePageState extends State<AddCoursePage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Course submitCourse = new Course();

  void _forSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      print(submitCourse.course_name);
      print(submitCourse.course_term);
      print(submitCourse.course_hours);
      print(submitCourse.major_id);

      Map<String, String> map = {
        "major_id": submitCourse.major_id.toString(),
        "course_name": submitCourse.course_name,
        "course_term": submitCourse.course_term,
        "course_hours": submitCourse.course_hours.toString(),
        "course_class_hold": submitCourse.course_class_hold.toString(),
        "course_hold": submitCourse.course_hold.toString()
      };
      Request.postData("http://$ip:$port/addCourse", () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("添加课程成功!(*￣︶￣)"),
                ));
      }, params: map);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (got == 0) {
      Request.getData("http://$ip:$port/getAllMajors", (data) {
        setState(() {
          var list = data['data'] as List;
          majors = list.map((i) => Major.fromJson(i)).toList();
          got = 1;
          print(majors);
          for (Major major in majors) {
            menu.add(
              new DropdownMenuItem(
                  child: Row(children: <Widget>[
                    Text(major.major_name),
                    SizedBox(width: 10),
                  ]),
                  value: major.major_id),
            );
          }
        });
      });
    }
    return new MaterialApp(
      title: 'Flutter data',
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepPurple,
          title: new Text('Flutter Form'),
          leading: RaisedButton(
            color: Colors.deepPurple,
            child: Text("<<<"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _forSubmitted,
          child: new Text('提交'),
        ),
        body: new Container(
          padding: const EdgeInsets.all(16.0),
          child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '课程名',
                  ),
                  validator: (val) {
                    return val.length == 0 ? "未输入课程名" : null;
                  },
                  onSaved: (val) {
                    submitCourse.course_name = val;
                  },
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '学期',
                  ),
                  validator: (val) {
                    return val.length != 3 ? "学期长度错误" : null;
                  },
                  onSaved: (val) {
                    submitCourse.course_term = val;
                  },
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '学时',
                  ),
                  validator: (val) {
                    return int.parse(val) <= 0 ? "学时必须为正数" : null;
                  },
                  onSaved: (val) {
                    submitCourse.course_hours = int.parse(val);
                  },
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '课程容量',
                  ),
                  validator: (val) {
                    return int.parse(val) <= 0 ? "容量必须为正数" : null;
                  },
                  onChanged: (val) {
                    submitCourse.course_hold = int.parse(val);
                  },
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '课堂容量',
                  ),
                  validator: (val) {
                    return (int.parse(val) <= 0 ||
                            int.parse(val) > submitCourse.course_hold)
                        ? "课堂必须为正数且不超过课程容量"
                        : null;
                  },
                  onSaved: (val) {
                    submitCourse.course_class_hold = int.parse(val);
                  },
                ),
                DropdownButton(
                    value: submitCourse.major_id,
                    //icon: Icon(Icons.arrow_right), iconSize: 40, iconEnabledColor: Colors.green.withOpacity(0.7),
                    hint: Text('请选择专业'),
                    isExpanded: true,
                    items: menu,
                    onChanged: (val) {
                      setState(() {
                        submitCourse.major_id = val;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
