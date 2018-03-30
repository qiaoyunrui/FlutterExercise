main() {
  DateTime now = new DateTime.now();
  print("当前时间： $now");
  // 指定时间
  DateTime victoryTime = new DateTime(1945, 9, 9);
  print("The time: $victoryTime");

  // 时间字符串转换
  DateTime time3 = DateTime.parse("1969-07-02");
  print(time3);

  // 时间跨度
  Duration timeRemaining = new Duration(days: 2, hours: 56, minutes: 14);
  print(timeRemaining);
}
