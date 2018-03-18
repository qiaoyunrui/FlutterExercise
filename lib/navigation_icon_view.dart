import 'package:flutter/material.dart';

//底部导航
class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget title,
    Color color,
    TickerProvider vsync,
  })
      : _icon = icon,
        _color = color,
        item = new BottomNavigationBarItem(icon: icon, title: title),
        controller = new AnimationController(
          //垂直同步
          vsync: vsync,
          duration: kThemeAnimationDuration,
        ) {
    //创建曲线动画
    _animation = new CurvedAnimation(
      //应用曲线动画的动画
      parent: controller,
      /**
       * 正向使用的曲线
       * 从 0.5
       * 到 1.0 结束
       * 应用的曲线：快速启动并缓和到最终位置的曲线
       */
      curve: new Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _icon;
  final Color _color;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  ///
  ///过渡转换
  ///BottomNavigationBarType: 定义底部导航栏的布局和行为
  ///ignore: slash_for_doc_comments, slash_for_doc_comments, slash_for_doc_comments, slash_for_doc_comments
  /// BuildContext: 处理控件树种的控件

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    //如果底部导航栏的位置和大小在点击时会变大
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      /**
       * 保存主题的颜色和排班值
       */
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }
    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 0.02),
          end: const Offset(0.0, 0.0),
        )
            .animate(_animation),
        child: new IconTheme(
            data: new IconThemeData(
              color: iconColor,
              size: 120.0,
            ),
            child: _icon),
      ),
    );
  }
}
