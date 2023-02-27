
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_meet/model/admodel.dart';



class Api_Provider extends ChangeNotifier {
  Map<String, String> requestHeaders = {
    'Host': '<calculated when request is sent>',
    'User-Agent': 'PostmanRuntime/7.30.0',
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
    'authorization': 'admin',
  };

  Data? Datapick;

  Future<Admodel> Apifactory() async {
    String newslike = "http://3.108.31.187:8080/get-appkey/5";
    var newsString = await http.get(Uri.parse(newslike),headers:requestHeaders);
    var newsjson = jsonDecode(newsString.body);
    return  Admodel.fromJson(newsjson);
  }
}