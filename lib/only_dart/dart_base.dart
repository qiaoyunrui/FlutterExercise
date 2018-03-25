void main() {
  int figureA = -93;
  //是否为负数
  print(figureA.isNegative);
  //是否是有限的
  print(figureA.isFinite);
  //是否为正无穷大或负无穷大
  print(figureA.isInfinite);

  double figureB = 12.345;
  // 返回 figureB 的符号，
  // -1.0：值小于 0
  // +1.0：值大于 0
  // -0.0/0.0/NaN：值是其本身
  print(figureB.sign);
  // 返回 figureB 运行的类型
  print(figureB.runtimeType);
  print(figureB.hashCode);

  int figureC = 13;
  // figureC 是否为奇数
  print(figureC.isOdd);
  // figureC 是否为偶数
  print(figureC.isEven);
  // 返回 figureC 所占存储位
  print(figureC.bitLength);

  print("----------");

  // 绝对值
  print(figureA.abs());
  // 返回大于 figureB 的双精度值
  print(figureB.floorToDouble());
  // 返回小于 figureB 的双精度值
  print(figureB.roundToDouble());
  // 返回 figureB 四舍五入的双精度值
  print(figureB.toStringAsFixed(2));
  // 返回 figureB 保留几位小数后精确结果的字符串
  print(figureB.toStringAsPrecision(3));

  print("-----------");

  int figureD = 12;
  // figureD 与其他整数的最大公约数
  print(figureD.gcd(18));
  // figureD 与其他整数的截取余数
  print(figureD.remainder(18));
  // figureD 几次幂值的字符串
  print(figureD.toStringAsExponential(2));

  print("-----------");

  String content = "HelloWorld";

  // 返回字符串的 UTF-16 代码单元列表
  print(content.codeUnits);
  // 返回字符串 Unicode 代码的可迭代对象
  print(content.runes);
  // 返回对象运行时类型
  print(content.runtimeType);

  print("-------正则表达式------");

  RegExp exp = new RegExp(r"(\w+)");
  // 正则表达式是否区分大小写
  print(exp.isCaseSensitive);
  // 正则表达式是否匹配多行
  print(exp.isMultiLine);
  // 返回源表达式字符串
  print(exp.pattern);

  print(exp.allMatches("abc def ghi"));
  print(exp.firstMatch(""));
  print(exp.hasMatch("as"));
  // 从第几个字符开始匹配正则表达式
  print(exp.matchAsPrefix("ab cd", 3));
  // 返回正则表达式的第一个匹配字符串
  print(exp.stringMatch("abc de"));
  // 返回正则表达式的字符串表示
  print(exp.toString());

  print("-----------Sample-----------");
  // 验证邮政编码
  RegExp postalcode = new RegExp(r'(\d{6})');
  print(postalcode.hasMatch("038300"));

  // 验证手机号
  RegExp mobile = new RegExp(r"(0|86|17951)?(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
  Iterable<Match> mobiles = mobile.allMatches("13812345678 12345678901 17012345678");
  for (Match m in mobiles) {
    String match = m.group(0);
    print(match);
  }

  // 验证网址 URL
  RegExp url = new RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
  print(url.firstMatch("http://www.google.com"));

  // 验证身份证号
  RegExp identity = new RegExp(r"\d{17}[\d|x]|\d{15}");
  print(identity.stringMatch("My id number is 35082419931023527x"));
}
