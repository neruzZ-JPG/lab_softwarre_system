import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  CoursePage({Key key}) : super(key: key);

  @override
  _coursePageState createState() => _coursePageState();
}

class _coursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: ClipOval(
            //调用本地图片很复杂且目前有bug,需要时看教程
              child: Image.network(
                  'https://img1.178.com/acg1/201303/156992455550/156993537911.gif',
                  // 'https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1986451467,394304688&fm=26&gp=0.jpg',
                  //高度和宽度过大的话会发生拉伸错误
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover)),
        ));
  }
}