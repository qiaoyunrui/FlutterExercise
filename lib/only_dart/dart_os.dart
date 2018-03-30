import "dart:io";

main() {
  // 运行命令行
  Process.run('Nslookup', ['www.baidu.com']).then((ProcessResult results) {
    print(results.stdout);
  });

  Process.run('Nslookup', ['www.baidu.com']).then((process) {
    print("退出代码： ${process.exitCode}");
  });
}
