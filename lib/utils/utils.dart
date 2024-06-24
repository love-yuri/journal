/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-24 18:54:03
 * @LastEditTime: 2024-06-24 23:14:00
 * @Description: 通用工具
 */
import 'dart:ui';

class Utils {
  // 十六进制转color
  static Color hexToColor(String hexColor) {
    // 去掉前导的 '#' 符号
    hexColor = hexColor.replaceFirst('#', '');

    // 如果没有提供 alpha 值，默认设为 FF（完全不透明）
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }

    // 将十六进制字符串转换为 int，并创建 Color 对象
    return Color(int.parse(hexColor, radix: 16));
  }

  static String now() {
    final dateTime = DateTime.now();
    final formatted = '${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)} '
                      '${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}:${_twoDigits(dateTime.second)}';
    return formatted;
  }

  static String _twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }
}
