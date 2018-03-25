import 'package:flutter/material.dart';
import 'package:study_flutter/achievement_view.dart';
import 'package:study_flutter/navigation_icon_view.dart';

void main() {
  /*runApp(new MaterialApp(
      title: "YiTiao",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("navigation demo"),
        ),
        body: new Center(
          child: new AchievementView(),
        ),
      );
  )*/
  runApp(new MaterialApp(
    title: "Hello",
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("HelloWorld"),
      ),
      body: new AchievementView(),
    ),
  ));
}

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取当前图标主题，创建与此图标相同的图标主题
    final IconThemeData iconTheme = IconTheme.of(context);
    return new Container(
      margin: const EdgeInsets.all(4.0),
      //图标主题的宽度减少 8.0
      width: iconTheme.size - 8.0,
      height: iconTheme.size - 8.0,
      decoration: new BoxDecoration(
        //图标主题的颜色
        color: iconTheme.color,
      ),
    );
  }
}

class MenusDemo extends StatefulWidget {
  @override
  _MenusDemoState createState() => new _MenusDemoState();
}

class _MenusDemoState extends State<MenusDemo> with TickerProviderStateMixin {
  int _currentIndex = 2;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  List<NavigationIconView> _navigationViews;

  /// 在对象插入到树种使用，
  /// 框架将为它创建的每个 State(状态) 对象调用此方法一次
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.access_alarm),
        title: new Text("成就"),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new CustomIcon(),
        title: new Text("行动"),
        color: Colors.deepOrange[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.cloud),
        title: new Text("人物"),
        color: Colors.teal[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.event_available),
        title: new Text("设置"),
        color: Colors.pink[500],
        vsync: this,
      )
    ];
    for (NavigationIconView view in _navigationViews) {
      //每次动画控制器的值更改时调用监听器
      view.controller.addListener(_rebuild);
    }
    //底部导航栏当前选择的动画控制器的值为 1.0
    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  //动画控制器的值更改时的操作
  void _rebuild() {
//    print("Hello ${_navigationViews.map((NavigationIconView value) => value.controller.value).toList()})}");
    //通知框架此对象内部状态已更改
    setState(() {
      //重建，以便为视图创建动画
    });
  }

  //创建过渡堆栈
  Widget _buildTransitionStack() {
    //存储不透明度转换的列表
    final List<FadeTransition> transitions = <FadeTransition>[];
    for (NavigationIconView view in _navigationViews) {
      //在存储不透明度转换的列表中添加 transition 函数的返回值
      transitions.add(view.transition(_type, context));
    }
    //对存储不透明度转换的列表进行排序
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.listenable;
      final Animation<double> bAnimation = b.listenable;
      double aValue = aAnimation.value;
      double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });
    return new Stack(
      children: transitions,
    );
  }

  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          //当前选择的地步导航栏项目，开始反向运行此动画
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          //当前选择的底部导航栏项目，开始正向运行此动画
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("navigation demo"),
        actions: <Widget>[
          new PopupMenuButton<BottomNavigationBarType>(
            itemBuilder: (BuildContext context) =>
                <PopupMenuItem<BottomNavigationBarType>>[
                  new PopupMenuItem<BottomNavigationBarType>(
                    child: new Text("Fixed"),
                    value: BottomNavigationBarType.fixed,
                  ),
                  new PopupMenuItem<BottomNavigationBarType>(
                    value: BottomNavigationBarType.shifting,
                    child: new Text("Shifting"),
                  ),
                ],
            onSelected: (BottomNavigationBarType value) {
              setState(() {
                _type = value;
              });
            },
          )
        ],
      ),
      body: new Center(
        child: _buildTransitionStack(),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
