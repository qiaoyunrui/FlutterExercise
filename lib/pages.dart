import 'package:flutter/material.dart';

const String _explanatoryText = """
    当Scaffold的浮动操作按钮改变时，新按钮消失并变成视图。
    在这个Demo中，更改选项卡会导致应用程序与浮动操作按钮重建，
    Scaffold通过键值与其他区分。
    """;

class _Page {
  _Page({
    this.label,
    this.colors,
    this.icon,
  });

  final String label;
  final MaterialColor colors;
  final IconData icon;

  Color get labelColor => colors != null ? colors[300] : Colors.grey[300];

  bool get fabDefined => colors != null && icon != null;

  Color get fabColor => colors[400];

  Icon get fabIcon => new Icon(icon);

  Key get fabKey => new ValueKey<Color>(fabColor);
}

final List<_Page> _allPages = <_Page>[
  new _Page(label: '蓝色', colors: Colors.indigo, icon: Icons.add),
  new _Page(label: '绿色', colors: Colors.green, icon: Icons.create),
  new _Page(label: '空白'),
  new _Page(label: '蓝绿色', colors: Colors.teal, icon: Icons.add),
  new _Page(label: '红色', colors: Colors.red, icon: Icons.create),
];

class MyApp extends StatelessWidget {
  build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _controller;
  _Page _selectedPage;

  initState() {
    super.initState();
    _controller = new TabController(length: _allPages.length, vsync: this);
    _controller.addListener(_handleTabSelection);
    _selectedPage = _allPages[0];
  }

  dispose() {
    super.dispose();
    _controller.dispose();
  }

  _handleTabSelection() {
    setState(() {
      _selectedPage = _allPages[_controller.index];
    });
  }

  void _showExplanatoryText() {
    _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {
      return new Container(
        decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: Theme.of(context).dividerColor)),
        ),
        child: new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Text(_explanatoryText),
        ),
      );
    });
  }

  buildTabView(_Page page) {
    // Builder: 将其构建委托给回调的控件
    return new Builder(builder: (BuildContext context) {
      return new Container(
        key: new ValueKey<String>(page.label),
        padding: const EdgeInsets.fromLTRB(48.0, 48.0, 48.0, 96.0),
        child: new Card(
          child: new Center(
            child: new Text(
              page.label,
              style: new TextStyle(
                color: page.labelColor,
                fontSize: 32.0,
              ),
            ),
          ),
        ),
      );
    });
  }

  build(context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.title),
        bottom: new TabBar(
          tabs: _allPages.map((_Page page) {
            return new Tab(
              text: page.label,
            );
          }).toList(),
          controller: _controller,
        ),
      ),
      floatingActionButton: !_selectedPage.fabDefined
          ? null
          : new FloatingActionButton(
              onPressed: _showExplanatoryText,
              key: _selectedPage.fabKey,
              tooltip: '显示说明',
              child: _selectedPage.fabIcon,
              backgroundColor: _selectedPage.fabColor,
            ),
      body: new TabBarView(
        children: _allPages.map(buildTabView).toList(),
        controller: _controller,
      ),
    );
  }
}
