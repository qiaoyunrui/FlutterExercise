import 'dart:io' show Platform, stdout;

main() {
  // 获取环境变量
  Map<String, String> envVars = Platform.environment;
  print(envVars['PATH'].replaceAll(';', "\n"));

  // 识别操作系统
  // 获取操作系统的字符串
  String os = Platform.operatingSystem;
  print("os: $os");
  // 检查操作系统
  stdout.write("你使用的是：");
  if (Platform.isMacOS) {
    stdout.writeln('MacOS');
  } else if (Platform.isAndroid) {
    stdout.writeln('Android');
  } else if (Platform.isLinux) {
    stdout.writeln('Linux');
  } else if (Platform.isWindows) {
    stdout.writeln('Windows');
  } else {
    stdout.writeln('Other');
  }

  // 获取运行脚本信息
  // 获取正在运行的脚本的URI
  var uri = Platform.script;
  print(uri);
  // 将 URI 转换为路径
  var path = uri.toFilePath();
  print(path);
}
