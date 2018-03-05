import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "YiTiao",
    home: new ContainerDemo(),
  ));
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("文本控件"),
      ),
      body: new Column(
        children: <Widget>[
          new Text(
            "黑色删除线",
            style: new TextStyle(
              color: const Color(0xffff0000),
              decoration: TextDecoration.lineThrough,
              decorationColor: const Color(0xff000000),
              fontSize: 25.0,
            ),
          ),
          new Text(
            "下划线",
            style: new TextStyle(
              color: const Color(0xffff9900),
              decoration: TextDecoration.underline,
              fontSize: 24.0,
            ),
          ),
          new Text(
            "虚线上划线 & 斜体",
            style: new TextStyle(
              decoration: TextDecoration.overline,
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 23.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          new Text(
            "serif 字体",
            style: new TextStyle(fontFamily: 'serif', fontSize: 26.0),
          ),
          new Text(
            "monospace 字体 & 加粗",
            style: new TextStyle(
              fontFamily: 'monospace',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          new Text(
            "2行跨度",
            style: new TextStyle(
              color: const Color(0xff4a86e8),
              fontSize: 25.0,
              height: 2.0,
            ),
          ),
          new Text(
            "2个字母间隔",
            style: new TextStyle(
              fontSize: 24.0,
              letterSpacing: 2.0,
            ),
          )
        ],
      ),
    );
  }
}
