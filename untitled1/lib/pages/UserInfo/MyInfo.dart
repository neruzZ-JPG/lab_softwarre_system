import 'package:flutter/material.dart';
import 'package:untitled1/common/HttpUtil.dart';
import 'package:untitled1/entity/Department.dart';
import 'package:untitled1/entity/User.dart';
import 'package:untitled1/tab/Tabs.dart';
import '../../utils/Request.dart';

final ip = HttpUtil.ip;
final port = HttpUtil.port;

User inUser;
Department department = new Department();

int got = 0;

class UserDetailPage extends StatefulWidget {
  UserDetailPage(User user, int refresh) {
    inUser = user;
    got = refresh;
  }

  @override
  _UserDetailState createState() => new _UserDetailState();
}

class _UserDetailState extends State<UserDetailPage> {
  User user = inUser;

  @override
  Widget build(BuildContext context) {
    if (got == 0) {
      Map<String, String> map = {
        "department_id": user.department_id.toString()
      };
      Request.getData("http://$ip:$port/getDepartmentById", (data) {
        setState(() {
          user.department = Department.fromJson(data["data"]);
          got = 1;
        });
      }, params: map);
    }

    DataTable table = TableBuilder(user: user).buildTable();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("俺的信息"),
          leading: RaisedButton(
              child: Text("<<<"),
              color: Colors.deepOrangeAccent,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Tabs();
                }));
              }),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(16),
                child: Align(
                  child: table,
                )),
          ],
        )));
  }
}

class TableBuilder {
  final User user;

  TableBuilder({this.user});

  DataTable buildTable() {
    return new DataTable(columns: [
      DataColumn(label: Text("")),
      DataColumn(label: Text(""))
    ], rows: [
      DataRow(cells: [DataCell(Text("用户姓名")), DataCell(Text(user.user_name))]),
      DataRow(cells: [
        DataCell(Text("用户id")),
        DataCell(Text(user.user_id.toString())),
      ]),
      DataRow(cells: [
        DataCell(Text("学院")),
        DataCell(Text(user.department.department_name))
      ]),
      DataRow(cells: [
        DataCell(Text("联系方式")),
        DataCell(Text(user.user_phone_number))
      ]),
      DataRow(cells: [DataCell(Text("账号")), DataCell(Text(user.user_account))]),
      DataRow(cells: [
        DataCell(Text("权限信息")),
        DataCell(Text(user.user_role == HttpUtil.role_admin ? "管理员" : "教师"))
      ]),
    ]);
  }
}
