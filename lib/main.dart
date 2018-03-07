import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "YiTiao",
    home: new LayoutDemo(),
  ));
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("水平方向布局"),
        ),
        body: new Padding(
          padding: const EdgeInsets.all(60.0),
          child: new Image.network("http://up.qqjia.com/z/25/tu32710_4.jpg"),
        ));
  }
}
