/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-26 21:24:09
 * @LastEditTime: 2024-06-26 23:10:10
 * @Description: 日志类
 */
import 'package:flutter/material.dart';
import 'package:journal/utils/utils.dart';
import 'package:logger/logger.dart';

// 简便使用
class Log {
  final _log = Logger();

  void d(dynamic value) {
    debugPrint("${Utils.now}: ${value.toString()}");
  }

  void i(dynamic value) {
    _log.i(value);
  }

  void w(dynamic value) {
    _log.w(value);
  }

  void e(dynamic value) {
    _log.e(value);
  }
}

Log log = Log();
