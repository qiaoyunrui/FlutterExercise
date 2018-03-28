void main() {
  var point = new Point.fromJson({'x': 2, 'y': 6});
  point.x = 4;
  print(point.x);
  print(point.y);
  var emp = new Employee.fromJson({});
  var temp = new ImmutablePoint(7, 8);
  print(temp.x);
  var logger = new Logger("UI");
  logger.log("Show Toast");
}

class Point {
  int x; //null
  int y; //null
  int z = 0;

  // 构造函数
  Point(this.x, this.y);

  // 命名构造函数
  // 在构造函数体运行之前初始化实例变量
  Point.fromJson(Map json)
      : x = json['x'],
        y = json['y'] {
    print("In Point.fromJson() : ($x : $y)");
  }

  // 重定向构造函数
  Point.alongXAxis(int x) : this(x, 0);
}

// 每个类都有一个隐式接口，包含所有类和实例成员，通过 implements 声明一个类实现一个或多个接口，
// 然后提供所需的 api 接口
class Person {
  final _name;

  Person(this._name);

  String greet(who) => "Hello, $who. I am $_name";

  Person.fromJson(Map data) {
    print("Person");
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson(data) {
    print("Employee");
  }
}

// 常量构造函数
class ImmutablePoint {
  final int x;
  final int y;

  const ImmutablePoint(this.x, this.y);

  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  // 使用 factory 关键字实现构造函数时，不一定要创建一个类的实例
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

class Rect {
  int left;
  int top;
  int height;
  int width;

  Rect(this.left, this.top, this.width, this.height);

  // 可以通过 getter 和 setter 创建附加属性，使用 get | set 关键字
  int get right => left + width;

  set right(int value) => left = value - width;

  int get bottom => top - height;

  set bottom(int value) => top = value - height;
}

class Vector {
  final int x;
  final int y;

  const Vector(this.x, this.y);

  // 运算符重载
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }
}

class Imposter implements Person {
  final name = "";
  String greet(who) => "Hi $who. Do you know I am?";
  @override
  get _name => null;
}
