import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "YiTiao",
    home: new MenusDemo(),
  ));
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello World"),
      ),
      body: new Center(
        child: new Opacity(
          opacity: 0.1,
          child: new Container(
            width: 250.0,
            height: 100.0,
            decoration: new BoxDecoration(
              color: const Color(0xff000000),
            ),
          ),
        ),
      ),
    );
  }
}

class MenusDemo extends StatefulWidget {
  @override
  _MenusDemoState createState() => new _MenusDemoState();
}

class _MenusDemoState extends State<MenusDemo> {
  String _bodyStr = "显示菜单的点击";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MenuDemo"),
        actions: <Widget>[
          new PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  new PopupMenuItem<String>(
                    child: new Text("选项一"),
                    value: "选项一的值",
                  ),
                  new PopupMenuItem<String>(
                    child: new Text("选项二"),
                    value: "选项二的值",
                  )
                ],
            onSelected: (String value) {
              setState(() {
                _bodyStr = value;
              });
            },
          )
        ],
      ),
      body: new Center(
        child: new Text(_bodyStr),
      ),
    );
  }
}
