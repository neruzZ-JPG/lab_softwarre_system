import 'package:flutter/material.dart';
import 'package:untitled1/entity/Software.dart';

import '../utils/Request.dart';
import '../common/HttpUtil.dart';

List<Software> softwares = new List<Software>();
int got = 0;

class SoftwarePage extends StatefulWidget {
  SoftwarePage(int refresh){
    got = refresh;
  }

  @override
  _softwarePageState createState() => _softwarePageState();
}

class _softwarePageState extends State<SoftwarePage> {
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
              trailing: Text(softwares[index].software_need == null
                  ? "null"
                  : softwares[index].software_need),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final ip = HttpUtil.ip;
    final port = HttpUtil.port;
    if (got == 0) {
      Request.getData("http://$ip:$port/getAllSoftwares", (data) {
        setState(() {
          var list = data['data'] as List;
          List<Software> tags = new List();
          softwares = list.map((i) => Software.fromJson(i)).toList();
          got = 1;
          print(softwares);
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
            itemCount: softwares.length,
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
