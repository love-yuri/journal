import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:journal/base/config.dart';
import 'package:journal/base/log.dart';
import 'package:xml/xml.dart';

// webdav类
class Webdav {
  late String _host;
  late String _username;
  late String _password;

  final _dio = Dio();

  // 配置参数
  final duration = const Duration(seconds: 20);

  static Webdav? _instance;

  Webdav._() {
    _host = WebdavConfig.host;
    _username = WebdavConfig.username;
    _password = WebdavConfig.password;

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

  Future<WebdavFile?> dir(String dirName) async {
    try {
      final response = await _dio.request(
        "$_host/dav/$dirName/",
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
      var xmld = XmlDocument.parse(response.data).findAllElements("d:response");
      var parent = _parseXml(xmld.first, null);
      parent.children = [];

      for (int i = 1; i < xmld.length; i++) {
        final xml = xmld.elementAt(i);
        parent.children!.add(_parseXml(xml, parent.path));
      }
      return parent;
    } catch (e) {
      log.e('Error fetching WebDAV content: $e');
    }
    return null;
  }

  Future<bool> mkdir(String dirName) async {
    try {
      // 发送 PROPFIND 请求
      final response = await _dio.request(
        "$_host/dav/$dirName/",
        options: Options(
          method: 'MKCOL',
          headers: {
            HttpHeaders.authorizationHeader:
                'Basic ${base64Encode(utf8.encode('$_username:$_password'))}', // 替换为你的用户名和密码
            HttpHeaders.contentTypeHeader: 'text/xml',
          },
        ),
      );
      return response.statusCode == 201;
    } catch (e) {
      log.e('Error fetching WebDAV content: $e');
    }
    return false;
  }

  Future<bool> upload(String dirName, File file) async {
    try {
      if (!file.existsSync()) {
        return false;
      }
      final response = await _dio.request(
        data: file.openRead(),
        "$_host/dav/$dirName/${p.basename(file.path)}",
        options: Options(
          method: 'PUT',
          headers: {
            HttpHeaders.authorizationHeader:'Basic ${base64Encode(utf8.encode('$_username:$_password'))}', // 替换为你的用户名和密码
            HttpHeaders.contentTypeHeader: 'application/octet-stream',
            HttpHeaders.contentLengthHeader: await file.length()
          },
        ),
      );
      return response.statusCode == 201 || response.statusCode == 204;
    } catch (e) {
      log.e('Error fetching WebDAV content: ${e.toString()}');
    }
    return false;
  }

  WebdavFile _parseXml(XmlElement xml, String? parent) {
    final name = xml.findElements("d:href").first.innerText;
    final isFile = xml.findElements("d:propstat").first
      .findElements('d:prop').first
      .findElements("d:resourcetype").first
      .innerXml.isEmpty;

    final isFolder = !isFile;
    return WebdavFile(isFile: isFile, isFolder: isFolder, parent: parent, path: name);
  }
}

class WebdavFile {
  final bool isFile;
  final bool isFolder;
  final String path;
  final String? parent;
  List<WebdavFile>? children;

  WebdavFile({
    required this.isFile,
    required this.isFolder,
    required this.path,
    this.parent,
    this.children
  });

  @override
  String toString() {
    return """

        isFile: $isFile
        path: $path
        parent: $parent
        children: $children
      """;
  }
}
