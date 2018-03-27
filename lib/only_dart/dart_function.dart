void main() {
  printA("A");
  printB("B");
  printC("C");
  print(say("China", "HelloWorld", "Android"));

  // 将函数作为参数传递给另一个函数
  [1, 2, 3].forEach(printElement);

  // 将函数分配给一个变量
  var loudify = (msg) => "!!!${msg.toUpperCase()} !!!";
  print(loudify("HelloWorld"));

  // 闭包
  // dart 的闭包就是函数对象
  Function add2 = makeAdder(2);
  Function add4 = makeAdder(4);

  print(makeAdder(3)(4));
  // ide 显示 bug
  print(add2(4));
  print(add4(3));

  var x;
  // 比较高阶函数
  x = foo;
  print(foo == x);

  // 比较静态方法
  x = SomeClass.bar;
  print(SomeClass.bar == x);

  //比较实例方法
  var v = new SomeClass();
  var w = new SomeClass();
  var y = w;
  x = w.baz;
  print(y.baz == x);
  print(v.baz != w.baz);
}

// 规范写法
void printA(String name) {
  print("My name is $name");
}

// 通俗写法
void printB(name) {
  print("His name is $name");
}

// 速成写法
void printC(String name) => print("Her name is $name");

// 用 [] 把参数包装起来，就能标识位置参数
// 用 = 指定默认值
String say(String from, String msg, [String device, String mood = "good"]) {
  String result = "$from says $msg.";
  if (device != null) {
    result = "$result with a $device";
  }
  if (mood != null) {
    result = "$result (in a $mood mood).";
  }
  return result;
}

printElement(element) {
  print(element);
}

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

foo() {}

class SomeClass {
  static void bar() {}

  void baz() {}
}
