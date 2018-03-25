import 'package:flutter/material.dart';
import 'achievement_view_list_item.dart';

class AchievementViewList extends StatefulWidget {
  final List<Target> targets;

  AchievementViewList({this.targets, Key key}) : super(key: key);

  @override
  _AchievementViewState createState() => new _AchievementViewState();
}

class _AchievementViewState extends State<AchievementViewList> {
  Set<Target> _achievements = new Set<Target>();

  void _achievementsChanged(Target target, bool newTarget) {
    setState(() {
      if (newTarget) {
        _achievements.add(target);
      } else {
        _achievements.remove(target);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: widget.targets.map((Target target) {
        return new AchievementViewItem(
          target: target,
          newTarget: _achievements.contains(target),
          onTargetChanged: _achievementsChanged,
        );
      }).toList(),
    );
  }
}
