/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 22:59:06
 * @LastEditTime: 2024-06-23 23:00:14
 * @Description: 日记详情-编辑
 */
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("日记详情"),
      ),
      body: Container(),
    );
  }
}
