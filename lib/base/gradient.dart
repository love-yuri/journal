import 'package:flutter/material.dart';

class GradientManager {
  static final bg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white,
      Colors.pink.shade50,
      Colors.pink.shade100,
      Colors.pink.shade200,
      Colors.pink.shade100,
      Colors.pink.shade50,
      Colors.white,
    ],
    stops: const [0.0, 0.15, 0.3, 0.5, 0.7, 0.85, 1.0],
  );

  static const homeBg = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFEE9CA7), // rgb(238, 156, 167)
      Color(0xFFFFDDE1), // rgb(255, 221, 225)
    ],
    stops: [0.0, 1.0],
  );
}
