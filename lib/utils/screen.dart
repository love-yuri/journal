import 'package:flutter/material.dart';

class ScreenUtils {
  static Size getDesignSize() {
    final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
    final short = firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
    final long = firstView.physicalSize.longestSide / firstView.devicePixelRatio;
    const scale = 0.96;
    return Size(short * scale, long * scale); // 设计尺寸，根据你的设计稿来确定。
  }
}
