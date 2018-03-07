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
      body: new Center(
        child: new Stack(
          children: <Widget>[
            new Image.network(
                'http://img2.cxtuku.com/00/13/12/s97783873391.jpg'),
            new Positioned(
                left: 25.0,
                right: 25.0,
                top: 45.0,
                child: new Text(
                  'AAAAAAAAAAAAA',
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'serif',
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
