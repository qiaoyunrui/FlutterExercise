import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadAndWriteDemo extends StatefulWidget {
  _ReadAndWriteState createState() => new _ReadAndWriteState();
}

class _ReadAndWriteState extends State<ReadAndWriteDemo> {
  int _counter;

  /// 获取本地文件目录
  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  /// 读取点击数
  /// 关键字 async 表示异步操作
  /// 返回 Future 类型，表示延时处理的对象
  Future<int> _readCounter() async {
    try {
      /// 读取本地文件目录
      /// await 表示等待操作完成
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString("$_counter");
  }

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then(
        (value) {
          print("Path: ${value.path}");
        }
    );
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('读写文件操作'),
      ),
      body: new Center(
        child: new Text("点击按钮${_counter == 0 ? '' : _counter}!"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: new Icon(Icons.add),
      ),
    );
  }
}
