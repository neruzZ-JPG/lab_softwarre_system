import 'package:flutter/material.dart';
import 'package:untitled1/common/HttpUtil.dart';
import 'package:untitled1/entity/Lab.dart';
import 'package:untitled1/utils/Request.dart';
import 'package:untitled1/entity/Location.dart';

List<Lab> labs = new List<Lab>();
int got = 0;

class LabPage extends StatefulWidget {
  LabPage(int referesh){
    got = referesh;
  }

  @override
  _labPageState createState() => _labPageState();
}

class _labPageState extends State<LabPage> {
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
      Request.getData("http://$ip:$port/getAllLabs", (data) {
        setState(() {
          var list = data['data'] as List;
          labs = list.map((i) => Lab.fromJson(i)).toList();
          got = 1;
          print(labs);
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
        });
      });
    }
    return Scaffold(
      body: Column(
        children: [
          FlatButton(
              color: Colors.white,
              child: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  got = 0;
                });
              }),
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
