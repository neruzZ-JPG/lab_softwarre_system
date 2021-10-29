import 'package:untitled1/common/HttpUtil.dart';
import 'package:untitled1/entity/Lab.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/tab/Tabs.dart';
import 'package:untitled1/utils/Request.dart';
import 'package:untitled1/entity/Location.dart';
import '../../main.dart';

List<Lab> labs = new List<Lab>();
int got = 0;

class MyLabPage extends StatefulWidget {
  MyLabPage(int refresh) {
    got = refresh;
  }

  @override
  _labPageState createState() => _labPageState();
}

class _labPageState extends State<MyLabPage> {
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
              title: Text(labs[index].lab_name),
              subtitle: Text(labs[index].location == null
                  ? "null"
                  : labs[index].location.location_building +
                      labs[index].location.location_room),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final ip = HttpUtil.ip;
    final port = HttpUtil.port;
    if (got == 0) {
      Map<String, String> map = {"user_id": user.user_id.toString()};
      Request.getData("http://$ip:$port/getLabByUserId", (data) {
        setState(() {
          var list = data['data'] as List;
          labs = list.map((i) => Lab.fromJson(i)).toList();
          got = 1;
          print(labs);
          if (labs.isEmpty) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("目前无管理的实验室ye~"),
                    ));
          } else {
            for (Lab lab in labs) {
              Map<String, String> map = {
                "location_id": lab.location_id.toString()
              };
              Request.getData("http://$ip:$port/getLocationById", (data) {
                setState(() {
                  Location location = Location.fromJson(data["data"]);
                  print(location.location_building);
                  print(location.location_room);
                  lab.location = location;
                });
              }, params: map);
            }
          }
        });
      }, params: map);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("我管理的实验室"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: RaisedButton(
          child: Text("<<<"),
          color: Colors.teal,
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return Tabs();
            // }));
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
            itemCount: labs.length,
            itemBuilder: this._getData,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2.5,
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
