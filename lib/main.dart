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
      body: new DecoratedBox(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: <Color>[const Color(0xff00ffff), const Color(0xffff6eb4)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
          ),
        ),
        child: new Container(
          width: 300.0,
          height: 300.0,
        ),
      ),
    );
  }
}
