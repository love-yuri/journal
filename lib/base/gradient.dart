/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 21:37:39
 * @LastEditTime: 2024-06-24 19:28:54
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:journal/utils/utils.dart';

class GradientManager {
  static LinearGradient bg = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Utils.hexToColor("DBEAFE"),
      Utils.hexToColor("E3EAFE"),
      Utils.hexToColor("9695CF"),
      Utils.hexToColor("9695CF"),
      Utils.hexToColor("9695CF"),
    ],
    stops: const [0.0, 0.1, 0.45, 0.6, 0.7 ],
  );

  static LinearGradient homeBg = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      const  Color(0xFFFFDDE1),
      Utils.hexToColor("#9695CF"),
    ],
    stops: const [0.0, 1.0],
  );
}
