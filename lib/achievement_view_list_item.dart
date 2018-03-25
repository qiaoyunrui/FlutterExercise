import 'package:flutter/material.dart';

class Target {
  //构造函数
  const Target({this.name, this.reward});

  final String name;
  final String reward;
}

typedef void TargetChangedCallback(Target target, bool newTarget);

class AchievementViewItem extends StatelessWidget {
  final Target target;
  final bool newTarget;
  final TargetChangedCallback onTargetChanged;

  AchievementViewItem({Target target, this.newTarget, this.onTargetChanged})
      : target = target,
        /*
        控件和元素的标识符：
        将其对象的标识用作其值
        用于将控件的标识绑定到用于生成控件的对象的标识
         */
        super(key: new ObjectKey(target));

  Color _getColor(BuildContext context) {
    return newTarget ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getNameTextStyle(BuildContext context) {
    if (!newTarget) {
      return new TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    }
    return new TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      //文本附近的装饰：文本中绘制一条横线
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle _getRewardTextStyle(BuildContext context) {
    if (!newTarget) {
      return new TextStyle(
        fontSize: 13.0,
        color: Colors.black,
      );
    }
    return new TextStyle(
      fontSize: 13.0,
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onTargetChanged(target, !newTarget);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text("囧"),
      ),
      title: new Text(
        target.name,
        style: _getNameTextStyle(context),
      ),
      subtitle: new Text(
        "奖励：\n${target.reward}",
        style: _getRewardTextStyle(context),
      ),
    );
  }
}
