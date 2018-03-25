import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//通过网络加载JSON文件
void _networkLoading() {
  http
      .get("https://domokit.github.io/examples/stocks/data/stock_data_2.json")
      .then((http.Response respone) {
    String netdata = respone.body;
//    print(netdata);
    JsonDecoder decoder = new JsonDecoder();
    List<List<String>> json = decoder.convert(netdata);
    print(json[0][1]);
  });
}

void main() {
  print("Hello");
  _networkLoading();
}
