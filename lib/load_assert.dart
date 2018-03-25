import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString("assets/config.json");
}

void _loadJson() {
  loadAsset().then((value) {
    print(value);
    JsonDecoder decoder = new JsonDecoder();
    Object obj = decoder.convert(value);
    print(obj);
  });
}

void main() {
  _loadJson();
}
