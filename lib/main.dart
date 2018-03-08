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
      body: new AspectRatio(
        aspectRatio: 2.0 / 2.0,
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.lightBlueAccent[100],
          ),
        ),
      ),
    );
  }
}
