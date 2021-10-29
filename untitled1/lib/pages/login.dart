import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled1/common/HttpUtil.dart';
import 'package:untitled1/entity/User.dart';

import '../main.dart';
import '../utils/Request.dart';
import '../tab/Tabs.dart';
import 'package:flutter/cupertino.dart';

bool result = false;

class TextFieldAndCheckPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<TextFieldAndCheckPage> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();

  //密码的控制器
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: FlatButton(
          child: Text('X'),
          color: Colors.indigoAccent,
          onPressed: (){
            exit(0);
          },
        ),
        title: Text('实验室软件管理系统'),
      ),
      body: Column(
        children: [
          //Text(user.user_name),
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.phone),
              labelText: '请输入你的用户名)',
              //helperText: '请输入注册的密码',
            ),
            autofocus: false,
          ),
          TextField(
              controller: passController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.lock),
                labelText: '请输入密码)',
              ),
              obscureText: true),
          RaisedButton(
            color: Colors.indigo,
            onPressed: _login,
            child: Text('登录'),
          ),
        ],
      ),
    );
  }

  void _login() {
    print({'phone': phoneController.text, 'password': passController.text});
    if (passController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请填写密码'),
              ));
    } else {
      final ip = HttpUtil.ip;
      final port = HttpUtil.port;
      // 1.构建URL
      final movieURL = "http://$ip:$port/login";
      Map<String, String> params = {
        "account": phoneController.text,
        "password": passController.text
      };
      // 2.发送网络请求获取结果
      Request.getData(movieURL, (data) {
        print("$data");
        setState(() {
          //先执行
          result = data["success"];
          print("result:$result");
          if (result == false) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("用户名或密码错误"),
                    ));
            phoneController.clear();
          } else {
            user = User.fromJson(data["data"]);
            print(user.user_name);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Tabs()));
          }
        });
      }, params: params);
    }
  }

  void onTextClear() {
    setState(() {
      phoneController.clear();
      passController.clear();
    });
  }
}
