import 'package:flutter/material.dart';

/// 枚举类，标签演示样式
enum TabsDemoStyle { iconsAndText, iconsOnly, textOnly }

class _Page {
  final IconData icon;
  final String text;

  _Page({this.icon, this.text});
}

// 存储所有页面的列表
final List<_Page> _allPages = <_Page>[
  new _Page(icon: Icons.event, text: 'EVENT'),
  new _Page(icon: Icons.home, text: 'HOME'),
  new _Page(icon: Icons.android, text: 'ANDROID'),
  new _Page(icon: Icons.alarm, text: 'ALARM'),
  new _Page(icon: Icons.face, text: 'FACE'),
  new _Page(icon: Icons.language, text: 'LANGUAGE'),
];

class ScrollableTabsDemo extends StatefulWidget {
  _ScrollTabsDemoState createState() => new _ScrollTabsDemoState();
}

class _ScrollTabsDemoState extends State<ScrollableTabsDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  TabsDemoStyle _demoStyle = TabsDemoStyle.iconsAndText;

  void initState() {
    _controller = new TabController(length: _allPages.length, vsync: this);
  }

  dispose() {
    super.dispose();
    _controller.dispose();
  }

  changeDemoStyle(TabsDemoStyle style) {
    setState(() {
      _demoStyle = style;
    });
  }

  @override
  build(BuildContext context) {
    final Color iconColor = Theme
        .of(context)
        .accentColor;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("可滚动的标签栏"),
        actions: <Widget>[
          new PopupMenuButton(
              onSelected: changeDemoStyle,
              itemBuilder: (BuildContext context) =>
              <PopupMenuItem<TabsDemoStyle>>[
                new PopupMenuItem<TabsDemoStyle>(
                  value: TabsDemoStyle.iconsAndText,
                  child: new Text("图标与文本"),
                ),
                new PopupMenuItem(
                  child: new Text("仅图标"),
                  value: TabsDemoStyle.iconsOnly,
                ),
                new PopupMenuItem(
                  child: new Text("仅文本"),
                  value: TabsDemoStyle.textOnly,
                )
              ])
        ],
        bottom: new TabBar(
          tabs: _allPages.map((_Page page) {
            switch (_demoStyle) {
              case TabsDemoStyle.iconsAndText:
                return new Tab(text: page.text, icon: new Icon(page.icon));
              case TabsDemoStyle.iconsOnly:
                return new Tab(icon: new Icon(page.icon));
              case TabsDemoStyle.textOnly:
                return new Tab(text: page.text);
            }
          }).toList(),
          controller: _controller,
          isScrollable: true,
        ),
      ),
      body: new TabBarView(
        children: _allPages.map((_Page page) {
          return new Container(
            key: new ObjectKey(page.icon),
            padding: const EdgeInsets.all(12.0),
            child: new Card(
              child: new Center(
                child: new Icon(
                  page.icon,
                  color: iconColor,
                  size: 128.0,
                ),
              ),
            ),
          );
        }).toList(),
        controller: _controller,
      ),
    );
  }
}
