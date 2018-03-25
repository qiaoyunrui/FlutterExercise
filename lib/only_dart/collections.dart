void main() {
  print("HelloWorld");

  // 固定长度的列表
  List<int> fixedLengthLists = new List(5);
  fixedLengthLists[0] = 97;

  // 可改变长度的列表
  List<int> growableList = [1, 2];
  print(growableList);

  growableList.add(499);

  // 创建包含所有元素的固定长度列表
  List fixedLengthListB = new List.unmodifiable([1, 2, 3]);

  // 创建包含所有元素的可改变长度列表
  List growableListC = new List.from([1, 2, 3]);
  growableListC.add(4);

  // 为所有元素统一赋值
  List fixedLengthListC = new List<int>.filled(3, 0);
  print(fixedLengthListC);

  // 用生成器给所有元素赋初始值
  List fixedLengthListD = new List<int>.generate(4, (index) {
    return index * index;
  });
  print(fixedLengthListD);

  // 对列表元素做一些改动
  List<String> listA = ['a', 'b', 'c'];
  // 从第几个元素开始覆盖原列表
  listA.setAll(1, ['hello', 'world']);
  print(listA);

  listA.shuffle();
  // 对列表进行随机排序
  print(listA);

  List<int> listC = [7, 8, 3, 4, 5];
  // 对列表进行顺序排序
  listC.sort();
  print(listC);

  // map
  // 几种构造函数
  Map<String, int> map = {"a": 1, "b": 2, "c": 3};

  List<int> listE = [1, 2, 3];
  Map<String, int> mapA = new Map.fromIterable(listE,
      key: (item) => item.toString(), value: (item) => item * item);
  print(mapA);

  List<String> letters = ['b', 'c'];
  List<String> words = ['bad', 'cat'];

  Map<String, String> mapB = new Map.fromIterables(letters, words);
  print(mapB);
}
