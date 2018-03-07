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
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print("点红色按钮事件");
            },
            color: const Color(0xffcc0000),
            child: new Text("红色按钮"),
          ),
          new Expanded(
            child: new RaisedButton(
              onPressed: () {
                print("点击黄色按钮事件");
              },
              color: const Color(0xfff1c232),
              child: new Text("黄色按钮"),
            ),
          ),
          new RaisedButton(
            onPressed: () {
              print("点击粉色按钮事件");
            },
            color: const Color(0xffea9999),
            child: new Text("粉色按钮"),
          )
        ],
      ),
    );
  }
}
