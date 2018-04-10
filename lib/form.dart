import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  createState() => new _MyApp();
}

class _MyApp extends State<MyApp> {
  String _lastName;
  String _firstName;
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  void _showMessage(String name) {
    showDialog(
        context: context,
        child: new AlertDialog(
          content: new Text(name),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text("确定"))
          ],
        ));
  }

  @override
  build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("表单输入"),
      ),
      body: new Form(
        child: new Column(
          children: <Widget>[
            new TextField(
              onChanged: (String value) {
                _lastName = value;
              },
            ),
            new TextField(
              onChanged: (String value) {
                _firstName = value;
              },
            ),
            new Row(
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    _formkey.currentState.reset();
                    _showMessage("姓名信息已经重置");
                  },
                  child: new Text("重置"),
                ),
                new RaisedButton(
                  onPressed: () {
                    // 保存 form 下的每个TextField
                    _formkey.currentState.save();
                    _showMessage('你的名字是： $_lastName$_firstName');
                  },
                  child: new Text("提交"),
                )
              ],
            ),
          ],
        ),
        key: _formkey,
      ),
    );
  }
}
