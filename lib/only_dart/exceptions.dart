import "dart:math";

void main() {
  print(PI);

  // dart 中所有基本类型数组和列表都是泛型，这样可以提高代码的可读性
  var names = new List<String>();
  names.addAll(["Hello"]);
  print(names is List<String>);


}

abstract class Cache<T> {
  T get(String key);

  put(String key, T value);
}
