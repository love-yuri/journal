import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

class Webdav {
  final _host = "https://dav.jianguoyun.com";
  final _username = "2078170658@qq.com";
  final _password = "anp5yqxr435upzhu";
  final _dio = Dio();

  // 配置参数
  final duration = const Duration(seconds: 20);

  static Webdav? _instance;

  Webdav._() {
    _dio.options = BaseOptions(
      sendTimeout: duration,
      receiveTimeout: duration,
      connectTimeout: duration,
    );
  }

  static Webdav get instance {
    _instance ??= Webdav._();
    return _instance!;
  }

  Future<void> fetchWebDavContent() async {
    try {
      // 发送 PROPFIND 请求
      final response = await _dio.request(
        "$_host/dav/test/",
        options: Options(
          method: 'PROPFIND',
          responseType: ResponseType.plain,
          headers: {
            HttpHeaders.authorizationHeader:
                'Basic ${base64Encode(utf8.encode('$_username:$_password'))}', // 替换为你的用户名和密码
            HttpHeaders.contentTypeHeader: 'text/xml',
          },
        ),
      );
      var xmld = XmlDocument.parse(response.data);
      for (var x in xmld.findAllElements("d:response")) {
        debugPrint(
            "name: ${x.findElements("d:href").first} isFile: ${x.findElements("d:propstat").firstOrNull?.findElements('d:prop').firstOrNull?.findElements("d:resourcetype").firstOrNull?.innerXml.isEmpty}");
      }
      // debugPrint(response.data);
    } catch (e) {
      debugPrint('Error fetching WebDAV content: $e');
    }
  }

  // Future<void> fetchWebDavContent() async {
  //   try {
  //     // 发送 PROPFIND 请求
  //     const baseUrl = "https://dav.jianguoyun.com";
  //     final response = await _dio.request(
  //       "$baseUrl/dav/test/",
  //       options: Options(
  //         method: 'PROPFIND',
  //         responseType: ResponseType.plain,
  //         headers: {
  //           HttpHeaders.authorizationHeader:
  //               'Basic ${base64Encode(utf8.encode('$_username:$_password'))}', // 替换为你的用户名和密码
  //           HttpHeaders.contentTypeHeader: 'text/xml',
  //         },
  //       ),
  //     );
  //     var xmld = XmlDocument.parse(response.data);
  //     for (var x in xmld.findAllElements("d:response")) {
  //       debugPrint(
  //           "name: ${x.findElements("d:href").first} isFile: ${x.findElements("d:propstat").firstOrNull?.findElements('d:prop').firstOrNull?.findElements("d:resourcetype").firstOrNull?.innerXml.isEmpty}");
  //     }
  //     // debugPrint(response.data);
  //   } catch (e) {
  //     debugPrint('Error fetching WebDAV content: $e');
  //   }
  // }

  // Future<void> fetchWebDavContent() async {
  //   try {
  //     // 发送 PROPFIND 请求
  //     final response = await _dio.request(
  //       "https://dav.jianguoyun.com/dav/test/",
  //       options: Options(
  //         method: 'MKCOL',
  //         responseType: ResponseType.json,
  //         headers: {
  //           HttpHeaders.authorizationHeader: 'Basic ${base64Encode(utf8.encode('$_username:$_password'))}', // 替换为你的用户名和密码
  //           HttpHeaders.contentTypeHeader: 'text/xml',
  //         },
  //       ),
  //     );
  //     debugPrint(response.data);
  //   } catch (e) {
  //     debugPrint('Error fetching WebDAV content: $e');
  //   }
  // }
}
