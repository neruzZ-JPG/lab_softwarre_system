import 'package:flutter/material.dart';
import 'home_request.dart';

void main() {
  runApp(LYHomePage());
}

class LYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("hello 大眠兽"),
            ),
            body: Center(
              child: RaisedButton(
                  child: Text("请求数据"),
                  onPressed: () {
                    HomeRequest.requestMovieList(0);
                  }),
            )));
  }
}
