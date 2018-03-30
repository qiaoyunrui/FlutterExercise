import 'dart:io';

import 'package:path/path.dart' as path;

main() {
  var newPath = path.join('/Users/shailen', 'dart/projects');
  print(newPath);
  print(path.split("/Users/Hello"));
  print(path.split(r'C:\tempdir\tmp.txt'));

  // 从当前目录到系统临时目录的路径
  print(path.relative(Directory.systemTemp.path));

  // 使用相对路径
  var path1 = "docs/book.html";
  var path2 = "articles/list";
  print(path.relative(path1, from: path2));
  print(path.relative(path2, from: path1));

  //使用绝对路径
  var samples = 'http://www.dartlang.org/samples';
  var docs = 'http://www.dartlang.org/docs';
  print(path.relative(samples, from: docs));
  print(path.relative(docs, from: samples));

  // URI 和路径的转换
  var uri = path.toUri("http://dartlang.org/samples");
  print(uri);
  print(path.fromUri(uri));

  // 路径文件的信息
  new File('${Directory.systemTemp.path}/dir/myFile.txt')
      .create(recursive: true)
      .then((file) {
    print("---");
    // 获取完整文件名
    print(path.basename(file.path));
    // 获取文件目录
    print(path.dirname(file.path));
    // 获取文件名
    print(path.basenameWithoutExtension(file.path));
    // 获取文件扩展名
    print(path.extension(file.path));
    print("---");
  });

  // 平台的路径分隔符
  print(Platform.pathSeparator);
  print(path.separator);
}
