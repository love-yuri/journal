/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 21:56:57
 * @LastEditTime: 2024-06-24 18:58:47
 * @Description: 卡片
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:journal/utils/utils.dart';

class JournalCard extends StatefulWidget {
  const JournalCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _JournalCardState();
  }
}

class _JournalCardState extends State<JournalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(width: 1.r, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
         Row(
          children: [
            const Text(
              "12月30日",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              "10:00 AM",
              style: TextStyle(
                color: Utils.hexToColor("#94A3B8"),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: const Text(
            overflow: TextOverflow.ellipsis,
            "Flutter 的布局系统会根据上级组件的约束assets/bg/ec006809-cb34-42b9-bc80-5902d06419f7.jpgassets/bg/ec006809-cb34-42b9-bc80-5902d06419f7.jpgassets/bg/ec006809-cb34-42b9-bc80-5902d06419f7.jpgassets/bg/ec006809-cb34-42b9-bc80-5902d06419f7.jpgassets/bg/ec006809-cb34-42b9-bc80-5902d06419f7.jpg",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
