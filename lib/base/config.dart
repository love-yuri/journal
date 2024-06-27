/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 21:50:42
 * @LastEditTime: 2024-06-26 21:07:25
 * @Description: 静态文件加载
 */
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// 静态文件配置
class AssetsConfig {
  static get homeBg => "assets/bg/1.jpg";
}

// 数据库设置
class DataBaseConfig {
  static Future<String> jorunalTableDbPath() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return p.join(dbFolder.path, 'journal.db');
  }

  static Future<File> jorunalTableDbFile() async {
    return File(await jorunalTableDbPath());
  }
}

class WebdavConfig {
  static get host => 'https://dav.jianguoyun.com';
  static get username => '2078170658@qq.com';
  static get password => 'anp5yqxr435upzhu';
  static get dbFolder => 'journal'; // 数据库上传的文件夹名称
}