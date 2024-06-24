/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 19:16:28
 * @LastEditTime: 2024-06-23 20:19:20
 * @Description: 程序入口
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:journal/base/route.dart';
import 'package:journal/utils/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtils.getDesignSize(),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteManager.generateRoute,
          initialRoute: RouteManager.home,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(),
            fontFamily: "PingFang",
          ),
          // home: HomePage(),
        );
      },
    );
  }
}
